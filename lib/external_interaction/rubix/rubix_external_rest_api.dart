import 'package:shelf_plus/shelf_plus.dart';
import 'package:sky/external_interaction/rubix/rubix_txn_request_stream.dart';
import 'package:sky/modules/auth_util.dart';
import 'package:sky/modules/shelf_plus_module/shelf_mod_types.dart';
import 'package:sky/native_interaction/rubix/rubix_util.dart';

var externalRubixApiHandlers = [
  CustomRoute(HttpVerb.get, '/ping', (Request request) => Response.ok('pong')),
  CustomRoute(HttpVerb.post, 'request-transaction', handleTransactionRequest),
];

ExternalAccessTokenJWTClaim getExternalUser(Request request) {
  var token = extractBearerTokenFromRequest(request);
  return ExternalAccessTokenJWTClaim.fromToken(token);
}

Future<Response> handleTransactionRequest(Request request) async {
  var body = await request.body.as(RubixTransactionRequest.fromJson);
  var externalUser = getExternalUser(request);

  var payload = RubixTransactionPayload.fromRequest(
      body, externalUser.getDID(), externalUser.getUuid());
  RubixTransactionRequestStream().add(payload);

  return Response.ok('Transaction request received');
}
//  TODO: write accesstoken test mode for testing app fexr
