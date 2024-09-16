///
//  Generated code. Do not modify.
//  source: native-interaction/rubix-external.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class AuthRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AuthRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uuid')
    ..hasRequiredFields = false
  ;

  AuthRequest._() : super();
  factory AuthRequest({
    $core.String? uuid,
  }) {
    final _result = create();
    if (uuid != null) {
      _result.uuid = uuid;
    }
    return _result;
  }
  factory AuthRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AuthRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AuthRequest clone() => AuthRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AuthRequest copyWith(void Function(AuthRequest) updates) => super.copyWith((message) => updates(message as AuthRequest)) as AuthRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AuthRequest create() => AuthRequest._();
  AuthRequest createEmptyInstance() => create();
  static $pb.PbList<AuthRequest> createRepeated() => $pb.PbList<AuthRequest>();
  @$core.pragma('dart2js:noInline')
  static AuthRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AuthRequest>(create);
  static AuthRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => clearField(1);
}

class OrgAuthRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'OrgAuthRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orgName', protoName: 'orgName')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'callBackUrl', protoName: 'callBackUrl')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sessionId', protoName: 'sessionId')
    ..hasRequiredFields = false
  ;

  OrgAuthRequest._() : super();
  factory OrgAuthRequest({
    $core.String? orgName,
    $core.String? callBackUrl,
    $core.String? sessionId,
  }) {
    final _result = create();
    if (orgName != null) {
      _result.orgName = orgName;
    }
    if (callBackUrl != null) {
      _result.callBackUrl = callBackUrl;
    }
    if (sessionId != null) {
      _result.sessionId = sessionId;
    }
    return _result;
  }
  factory OrgAuthRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OrgAuthRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OrgAuthRequest clone() => OrgAuthRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OrgAuthRequest copyWith(void Function(OrgAuthRequest) updates) => super.copyWith((message) => updates(message as OrgAuthRequest)) as OrgAuthRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OrgAuthRequest create() => OrgAuthRequest._();
  OrgAuthRequest createEmptyInstance() => create();
  static $pb.PbList<OrgAuthRequest> createRepeated() => $pb.PbList<OrgAuthRequest>();
  @$core.pragma('dart2js:noInline')
  static OrgAuthRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OrgAuthRequest>(create);
  static OrgAuthRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get orgName => $_getSZ(0);
  @$pb.TagNumber(1)
  set orgName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOrgName() => $_has(0);
  @$pb.TagNumber(1)
  void clearOrgName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get callBackUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set callBackUrl($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCallBackUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearCallBackUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get sessionId => $_getSZ(2);
  @$pb.TagNumber(3)
  set sessionId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSessionId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSessionId() => clearField(3);
}

class OrgStatus extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'OrgStatus', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..hasRequiredFields = false
  ;

  OrgStatus._() : super();
  factory OrgStatus({
    $core.bool? status,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory OrgStatus.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OrgStatus.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OrgStatus clone() => OrgStatus()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OrgStatus copyWith(void Function(OrgStatus) updates) => super.copyWith((message) => updates(message as OrgStatus)) as OrgStatus; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OrgStatus create() => OrgStatus._();
  OrgStatus createEmptyInstance() => create();
  static $pb.PbList<OrgStatus> createRepeated() => $pb.PbList<OrgStatus>();
  @$core.pragma('dart2js:noInline')
  static OrgStatus getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OrgStatus>(create);
  static OrgStatus? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get status => $_getBF(0);
  @$pb.TagNumber(1)
  set status($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}

class TxnRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TxnRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'receiver')
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amount', $pb.PbFieldType.OD)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'comment')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.O3)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'purpose')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'externalParty', protoName: 'externalParty')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ticker')
    ..hasRequiredFields = false
  ;

  TxnRequest._() : super();
  factory TxnRequest({
    $core.String? receiver,
    $core.double? amount,
    $core.String? comment,
    $core.int? type,
    $core.String? purpose,
    $core.String? externalParty,
    $core.String? ticker,
  }) {
    final _result = create();
    if (receiver != null) {
      _result.receiver = receiver;
    }
    if (amount != null) {
      _result.amount = amount;
    }
    if (comment != null) {
      _result.comment = comment;
    }
    if (type != null) {
      _result.type = type;
    }
    if (purpose != null) {
      _result.purpose = purpose;
    }
    if (externalParty != null) {
      _result.externalParty = externalParty;
    }
    if (ticker != null) {
      _result.ticker = ticker;
    }
    return _result;
  }
  factory TxnRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TxnRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TxnRequest clone() => TxnRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TxnRequest copyWith(void Function(TxnRequest) updates) => super.copyWith((message) => updates(message as TxnRequest)) as TxnRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TxnRequest create() => TxnRequest._();
  TxnRequest createEmptyInstance() => create();
  static $pb.PbList<TxnRequest> createRepeated() => $pb.PbList<TxnRequest>();
  @$core.pragma('dart2js:noInline')
  static TxnRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TxnRequest>(create);
  static TxnRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get receiver => $_getSZ(0);
  @$pb.TagNumber(1)
  set receiver($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasReceiver() => $_has(0);
  @$pb.TagNumber(1)
  void clearReceiver() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get amount => $_getN(1);
  @$pb.TagNumber(2)
  set amount($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get comment => $_getSZ(2);
  @$pb.TagNumber(3)
  set comment($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasComment() => $_has(2);
  @$pb.TagNumber(3)
  void clearComment() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get type => $_getIZ(3);
  @$pb.TagNumber(4)
  set type($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get purpose => $_getSZ(4);
  @$pb.TagNumber(5)
  set purpose($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPurpose() => $_has(4);
  @$pb.TagNumber(5)
  void clearPurpose() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get externalParty => $_getSZ(5);
  @$pb.TagNumber(6)
  set externalParty($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasExternalParty() => $_has(5);
  @$pb.TagNumber(6)
  void clearExternalParty() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get ticker => $_getSZ(6);
  @$pb.TagNumber(7)
  set ticker($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTicker() => $_has(6);
  @$pb.TagNumber(7)
  void clearTicker() => clearField(7);
}

