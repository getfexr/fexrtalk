///
//  Generated code. Do not modify.
//  source: native-interaction/rubix-external.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'rubix-external.pb.dart' as $0;
import '../google/protobuf/empty.pb.dart' as $1;
export 'rubix-external.pb.dart';

class RubixExternalClient extends $grpc.Client {
  static final _$approveAuthRequest =
      $grpc.ClientMethod<$0.AuthRequest, $1.Empty>(
          '/protos.RubixExternal/ApproveAuthRequest',
          ($0.AuthRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$approveOrgAuthRequest =
      $grpc.ClientMethod<$0.OrgAuthRequest, $0.OrgStatus>(
          '/protos.RubixExternal/ApproveOrgAuthRequest',
          ($0.OrgAuthRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.OrgStatus.fromBuffer(value));
  static final _$streamTransactionRequest =
      $grpc.ClientMethod<$1.Empty, $0.TxnRequest>(
          '/protos.RubixExternal/StreamTransactionRequest',
          ($1.Empty value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.TxnRequest.fromBuffer(value));

  RubixExternalClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.Empty> approveAuthRequest($0.AuthRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$approveAuthRequest, request, options: options);
  }

  $grpc.ResponseFuture<$0.OrgStatus> approveOrgAuthRequest(
      $0.OrgAuthRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$approveOrgAuthRequest, request, options: options);
  }

  $grpc.ResponseStream<$0.TxnRequest> streamTransactionRequest($1.Empty request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$streamTransactionRequest, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class RubixExternalServiceBase extends $grpc.Service {
  $core.String get $name => 'protos.RubixExternal';

  RubixExternalServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.AuthRequest, $1.Empty>(
        'ApproveAuthRequest',
        approveAuthRequest_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AuthRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.OrgAuthRequest, $0.OrgStatus>(
        'ApproveOrgAuthRequest',
        approveOrgAuthRequest_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.OrgAuthRequest.fromBuffer(value),
        ($0.OrgStatus value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.TxnRequest>(
        'StreamTransactionRequest',
        streamTransactionRequest_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.TxnRequest value) => value.writeToBuffer()));
  }

  $async.Future<$1.Empty> approveAuthRequest_Pre(
      $grpc.ServiceCall call, $async.Future<$0.AuthRequest> request) async {
    return approveAuthRequest(call, await request);
  }

  $async.Future<$0.OrgStatus> approveOrgAuthRequest_Pre(
      $grpc.ServiceCall call, $async.Future<$0.OrgAuthRequest> request) async {
    return approveOrgAuthRequest(call, await request);
  }

  $async.Stream<$0.TxnRequest> streamTransactionRequest_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Empty> request) async* {
    yield* streamTransactionRequest(call, await request);
  }

  $async.Future<$1.Empty> approveAuthRequest(
      $grpc.ServiceCall call, $0.AuthRequest request);
  $async.Future<$0.OrgStatus> approveOrgAuthRequest(
      $grpc.ServiceCall call, $0.OrgAuthRequest request);
  $async.Stream<$0.TxnRequest> streamTransactionRequest(
      $grpc.ServiceCall call, $1.Empty request);
}
