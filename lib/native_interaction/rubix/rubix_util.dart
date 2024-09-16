import 'dart:typed_data';

import 'package:basic_utils/basic_utils.dart' as basic_utils;
import 'package:pointycastle/pointycastle.dart';
import 'package:grpc/grpc.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:pointycastle/export.dart';
import 'package:sky/modules/hive/hive.dart';
import 'package:sky/modules/hive/hive_boxes.dart';
import 'package:sky/modules/utils.dart';
import 'package:sky/native_interaction/rubix/rubix_platform_calls.dart';
import 'package:sky/config.dart';

final String _secret = Config().jwtAuthSecret;
final String _issuer = 'Fexr Sky';
final String _portMapIndex = 'peer_id_index';

enum _RubixTokenType { challengeToken, accessToken, externalAccessToken, orgAccessToken }

String _getClaimType(JwtClaim claim) {
  return claim.toJson()['type'];
}

class AccountInfoResponse {
  bool status;
  String message;
  dynamic result;
  List<AccountInfo> accountInfo;

  AccountInfoResponse({
    required this.status,
    required this.message,
    required this.result,
    required this.accountInfo,
  });

  factory AccountInfoResponse.fromJson(Map<String, dynamic> json) {
    return AccountInfoResponse(
      status: json['status'],
      message: json['message'],
      result: json['result'],
      accountInfo: (json['account_info'] as List<dynamic>)
          .map((item) => AccountInfo.fromJson(item))
          .toList(),
    );
  }
}

class AccountInfo {
  String did;
  int didType;
  int wholeRbt;
  int pledgedWholeRbt;
  int lockedWholeRbt;
  int partRbt;
  int pledgedPartRbt;
  int lockedPartRbt;

  AccountInfo({
    required this.did,
    required this.didType,
    required this.wholeRbt,
    required this.pledgedWholeRbt,
    required this.lockedWholeRbt,
    required this.partRbt,
    required this.pledgedPartRbt,
    required this.lockedPartRbt,
  });

  factory AccountInfo.fromJson(Map<String, dynamic> json) {
    return AccountInfo(
      did: json['did'],
      didType: json['did_type'],
      wholeRbt: json['whole_rbt'],
      pledgedWholeRbt: json['pledged_whole_rbt'],
      lockedWholeRbt: json['locked_whole_rbt'],
      partRbt: json['part_rbt'],
      pledgedPartRbt: json['pledged_part_rbt'],
      lockedPartRbt: json['locked_part_rbt'],
    );
  }
}

class Token {
  final String token;
  final DateTime expiry;

  Token(this.token, this.expiry);
}

class RubixNodeBalancer {
  RubixNodeBalancer._internal();
  static final RubixNodeBalancer _instance = RubixNodeBalancer._internal();
  factory RubixNodeBalancer() {
    return _instance;
  }

  int _currentPortIndex = 0;
  Future<void> setCurrentPortIndex() async {
    _currentPortIndex = await loadPortIndex();
    print('Rubix port index: $_currentPortIndex');
  }

  final BiMap<String, int> rubixPeerIdPortMap =
      BiMap.fromMap(Config().rubixPeerIdPortMap);
  // Circularly iterate through the ports
  String getNextPeerId() {
    var peerIds = rubixPeerIdPortMap.keys.toList();
    var peerId = peerIds[_currentPortIndex];
    _currentPortIndex = (_currentPortIndex + 1) % peerIds.length;
    savePortIndex(_currentPortIndex);
    return peerId;
  }

  RubixInstance getRubixNode({String? peerId}) {
    try {
      String sPeerId;
      if (peerId == null) {
        // For new create DID requests, we will use the next peerId
        sPeerId = getNextPeerId();
      } else {
        sPeerId = peerId;
      }
      var port = rubixPeerIdPortMap[sPeerId];
      return RubixInstance(sPeerId, port, '127.0.0.1:$port');
    } catch (e) {
      throw RubixException('Invalid peerId');
    }
  }

  void savePortIndex(int index) async {
    final box = await openBox(HiveBox.rubix);
    await box.put(_portMapIndex, index);
    await box.close();
  }

  Future<int> loadPortIndex() async {
    final box = await openBox(HiveBox.rubix);
    var portMapIndex = box.get(_portMapIndex, defaultValue: 0);
    await box.close();
    return portMapIndex;
  }
}

class SecondarySignature {
  bool _verifySignature(
      ECPublicKey publicKey, Uint8List messageBytes, Uint8List signaturebytes) {
    var verifier = ECDSASigner()
      ..init(
        false,
        PublicKeyParameter(publicKey),
      );
    var sequence = ASN1Sequence.fromBytes(signaturebytes);
    var r = (sequence.elements![0] as ASN1Integer).integer;
    var s = (sequence.elements![1] as ASN1Integer).integer;
    var signature = ECSignature(r!, s!);

    var verified = verifier.verifySignature(messageBytes, signature);
    return verified;
  }

  void ecdsaVerify(
      {required String publicKey,
      required String payload,
      required List<int> signature}) {
    var payloadCodeUnits = payload.codeUnits;

    var ecPublicKey = publicKeyFromPem(publicKey);
    var payloadBytes = Uint8List.fromList(payloadCodeUnits);
    var signatureBytes = Uint8List.fromList(signature);

    var verified = _verifySignature(ecPublicKey, payloadBytes, signatureBytes);
    if (!verified) {
      throw GrpcError.unauthenticated('Failed to verify signature');
    }
  }

  ECPublicKey publicKeyFromPem(String publicKeyPem) {
    return basic_utils.CryptoUtils.ecPublicKeyFromPem(publicKeyPem);
  }
}

class AccessTokenJWTClaim extends JwtClaim {
  AccessTokenJWTClaim({
    required String did,
    required DateTime expiry,
    required String peerId,
    required String publicKey,
  }) : super(
          issuer: _issuer,
          subject: did,
          maxAge: Duration(days: 30),
          otherClaims: {
            'type': _RubixTokenType.accessToken.toString(),
            'peerId': peerId,
            'publicKey': publicKey,
          },
        );

  factory AccessTokenJWTClaim.fromJWTClaim(JwtClaim claim) {
    return AccessTokenJWTClaim(
      did: claim.subject!,
      expiry: claim.expiry!,
      peerId: claim.toJson()['peerId'],
      publicKey: claim.toJson()['publicKey'],
    );
  }

  String getDid() {
    return subject!;
  }

  String getPeerId() {
    return toJson()['peerId'];
  }

  String getPublicKey() {
    return toJson()['publicKey'];
  }
}

class ExternalAccessTokenJWTClaim extends JwtClaim {
  ExternalAccessTokenJWTClaim({
    required String did,
    required DateTime expiry,
    required String peerId,
    required String uuid,
  }) : super(
          issuer: _issuer,
          subject: uuid,
          maxAge: Duration(days: 30),
          otherClaims: {
            'type': _RubixTokenType.externalAccessToken.toString(),
            'peerId': peerId,
            'did': did,
          },
        );

  factory ExternalAccessTokenJWTClaim.fromJWTClaim(JwtClaim claim) {
    return ExternalAccessTokenJWTClaim(
      uuid: claim.subject!,
      expiry: claim.expiry!,
      peerId: claim.toJson()['peerId'],
      did: claim.toJson()['did'],
    );
  }

  factory ExternalAccessTokenJWTClaim.fromToken(String token) {
    return ExternalAccessTokenJWTClaim.fromJWTClaim(
        verifyJwtHS256Signature(token, _secret));
  }

  String getUuid() {
    return subject!;
  }

  String getPeerId() {
    return toJson()['peerId'];
  }

  String getDID() {
    return toJson()['did'];
  }
}

class OrgAccessTokenJWTClaim extends JwtClaim {
  OrgAccessTokenJWTClaim({
    required String did,
    required DateTime expiry,
    required String peerId,
    required String orgName,
  }) : super(
          issuer: _issuer,
          subject: orgName,
          maxAge: Duration(days: 30),
          otherClaims: {
            'type': _RubixTokenType.orgAccessToken.toString(),
            'peerId': peerId,
            'did': did,
          },
        );

  factory OrgAccessTokenJWTClaim.fromJWTClaim(JwtClaim claim) {
    return OrgAccessTokenJWTClaim(
      orgName: claim.subject!,
      expiry: claim.expiry!,
      peerId: claim.toJson()['peerId'],
      did: claim.toJson()['did'],
    );
  }

  factory OrgAccessTokenJWTClaim.fromToken(String token) {
    return OrgAccessTokenJWTClaim.fromJWTClaim(
        verifyJwtHS256Signature(token, _secret));
  }

  String getOrgName() {
    return subject!;
  }

  String getPeerId() {
    return toJson()['peerId'];
  }

  String getDID() {
    return toJson()['did'];
  }
}

class OrgAccessToken {
  static final int _accessTokenMaxAge = 30; // days
  static Token get(
      {required String did, required String peerId, required String orgName}) {
    final JwtClaim claimSet = OrgAccessTokenJWTClaim(
      did: did,
      expiry: DateTime.now().add(Duration(days: _accessTokenMaxAge)),
      peerId: peerId,
      orgName: orgName,
    );

    return Token(issueJwtHS256(claimSet, _secret), claimSet.expiry!);
  }
}

class ExternalAccessToken {
  static final int _accessTokenMaxAge = 30; // days
  static Token get(
      {required String did, required String peerId, required String uuid}) {
    final JwtClaim claimSet = ExternalAccessTokenJWTClaim(
      did: did,
      expiry: DateTime.now().add(Duration(days: _accessTokenMaxAge)),
      peerId: peerId,
      uuid: uuid,
    );

    return Token(issueJwtHS256(claimSet, _secret), claimSet.expiry!);
  }
}

class AccesToken {
  static final int _accessTokenMaxAge = 30; // days
  static Token get(
      {required String did,
      required String peerId,
      required String publicKey}) {
    final JwtClaim claimSet = AccessTokenJWTClaim(
      did: did,
      expiry: DateTime.now().add(Duration(days: _accessTokenMaxAge)),
      peerId: peerId,
      publicKey: publicKey,
    );
    return Token(issueJwtHS256(claimSet, _secret), claimSet.expiry!);
  }

  static _getTestAccessTokenJWTClaim() {
    final JwtClaim testCLaim = JwtClaim(
      issuer: _issuer,
      subject: 'did.D1',
      maxAge: Duration(days: 1),
      otherClaims: {
        'type': _RubixTokenType.accessToken.toString(),
        'peerId': 'peerId.P1',
        'publicKey': 'publicKey.Pk1',
      },
    );

    return AccessTokenJWTClaim.fromJWTClaim(testCLaim);
  }

  static AccessTokenJWTClaim verify(String token, {bool checkExpiry = true}) {
    try {
      if (Config().test) {
        print('Rubix: Test mode is enabled. Skipping token verification.');
        if (token == 'rubix-fake-token') {
          return _getTestAccessTokenJWTClaim();
        }
      }

      final JwtClaim claim = verifyJwtHS256Signature(token, _secret);
      if (checkExpiry == true) {
        claim.validate(
          issuer: _issuer,
        );
      }

      if (_getClaimType(claim) == _RubixTokenType.accessToken.toString()) {
        return AccessTokenJWTClaim.fromJWTClaim(claim);
      } else {
        throw Exception('Invalid token type');
      }
    } on JwtException {
      return throw Exception('Invalid token');
    }
  }
}

class ChallengeToken {
  static final int _challengeTokenMaxAge = 10; // minutes

  static Token get({required String publicKey}) {
    final JwtClaim claimSet = JwtClaim(
        issuer: _issuer,
        subject: publicKey,
        maxAge: Duration(minutes: _challengeTokenMaxAge),
        otherClaims: {
          'type': _RubixTokenType.challengeToken.toString(),
        });
    return Token(issueJwtHS256(claimSet, _secret), claimSet.expiry!);
  }

  static JwtClaim verify(String token) {
    try {
      final JwtClaim claim = verifyJwtHS256Signature(token, _secret);

      claim.validate(
        issuer: _issuer,
      );

      if (_getClaimType(claim) == _RubixTokenType.challengeToken.toString()) {
        return claim;
      } else {
        throw Exception('Invalid token type');
      }
    } on JwtException {
      return throw Exception('Invalid token');
    }
  }

  static String getPublicKey(String token) {
    return verify(token).subject!;
  }
}
