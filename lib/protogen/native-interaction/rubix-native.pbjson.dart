///
//  Generated code. Do not modify.
//  source: native-interaction/rubix-native.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use createDIDReqDescriptor instead')
const CreateDIDReq$json = const {
  '1': 'CreateDIDReq',
  '2': const [
    const {'1': 'didImage', '3': 1, '4': 1, '5': 9, '10': 'didImage'},
    const {'1': 'publicShare', '3': 2, '4': 1, '5': 9, '10': 'publicShare'},
    const {'1': 'publicKey', '3': 3, '4': 1, '5': 9, '10': 'publicKey'},
  ],
};

/// Descriptor for `CreateDIDReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createDIDReqDescriptor = $convert.base64Decode('CgxDcmVhdGVESURSZXESGgoIZGlkSW1hZ2UYASABKAlSCGRpZEltYWdlEiAKC3B1YmxpY1NoYXJlGAIgASgJUgtwdWJsaWNTaGFyZRIcCglwdWJsaWNLZXkYAyABKAlSCXB1YmxpY0tleQ==');
@$core.Deprecated('Use createDIDResDescriptor instead')
const CreateDIDRes$json = const {
  '1': 'CreateDIDRes',
  '2': const [
    const {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    const {'1': 'status', '3': 2, '4': 1, '5': 8, '10': 'status'},
  ],
};

/// Descriptor for `CreateDIDRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createDIDResDescriptor = $convert.base64Decode('CgxDcmVhdGVESURSZXMSEAoDZGlkGAEgASgJUgNkaWQSFgoGc3RhdHVzGAIgASgIUgZzdGF0dXM=');
@$core.Deprecated('Use requestTransactionPayloadReqDescriptor instead')
const RequestTransactionPayloadReq$json = const {
  '1': 'RequestTransactionPayloadReq',
  '2': const [
    const {'1': 'receiver', '3': 1, '4': 1, '5': 9, '10': 'receiver'},
    const {'1': 'sender', '3': 2, '4': 1, '5': 9, '10': 'sender'},
    const {'1': 'tokenCount', '3': 3, '4': 1, '5': 1, '10': 'tokenCount'},
    const {'1': 'comment', '3': 4, '4': 1, '5': 9, '10': 'comment'},
    const {'1': 'type', '3': 5, '4': 1, '5': 5, '10': 'type'},
  ],
};

/// Descriptor for `RequestTransactionPayloadReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestTransactionPayloadReqDescriptor = $convert.base64Decode('ChxSZXF1ZXN0VHJhbnNhY3Rpb25QYXlsb2FkUmVxEhoKCHJlY2VpdmVyGAEgASgJUghyZWNlaXZlchIWCgZzZW5kZXIYAiABKAlSBnNlbmRlchIeCgp0b2tlbkNvdW50GAMgASgBUgp0b2tlbkNvdW50EhgKB2NvbW1lbnQYBCABKAlSB2NvbW1lbnQSEgoEdHlwZRgFIAEoBVIEdHlwZQ==');
@$core.Deprecated('Use requestTransactionPayloadResDescriptor instead')
const RequestTransactionPayloadRes$json = const {
  '1': 'RequestTransactionPayloadRes',
  '2': const [
    const {'1': 'requestId', '3': 1, '4': 1, '5': 9, '10': 'requestId'},
    const {'1': 'hash', '3': 2, '4': 1, '5': 9, '10': 'hash'},
  ],
};

/// Descriptor for `RequestTransactionPayloadRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestTransactionPayloadResDescriptor = $convert.base64Decode('ChxSZXF1ZXN0VHJhbnNhY3Rpb25QYXlsb2FkUmVzEhwKCXJlcXVlc3RJZBgBIAEoCVIJcmVxdWVzdElkEhIKBGhhc2gYAiABKAlSBGhhc2g=');
@$core.Deprecated('Use hashSignedDescriptor instead')
const HashSigned$json = const {
  '1': 'HashSigned',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'pvtSign', '3': 2, '4': 1, '5': 12, '10': 'pvtSign'},
    const {'1': 'imgSign', '3': 3, '4': 1, '5': 12, '10': 'imgSign'},
  ],
};

/// Descriptor for `HashSigned`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List hashSignedDescriptor = $convert.base64Decode('CgpIYXNoU2lnbmVkEg4KAmlkGAEgASgJUgJpZBIYCgdwdnRTaWduGAIgASgMUgdwdnRTaWduEhgKB2ltZ1NpZ24YAyABKAxSB2ltZ1NpZ24=');
@$core.Deprecated('Use statusDescriptor instead')
const Status$json = const {
  '1': 'Status',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
  ],
};

/// Descriptor for `Status`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List statusDescriptor = $convert.base64Decode('CgZTdGF0dXMSFgoGc3RhdHVzGAEgASgIUgZzdGF0dXM=');
@$core.Deprecated('Use generateReqDescriptor instead')
const GenerateReq$json = const {
  '1': 'GenerateReq',
  '2': const [
    const {'1': 'tokenCount', '3': 1, '4': 1, '5': 1, '10': 'tokenCount'},
    const {'1': 'did', '3': 2, '4': 1, '5': 9, '10': 'did'},
  ],
};

/// Descriptor for `GenerateReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generateReqDescriptor = $convert.base64Decode('CgtHZW5lcmF0ZVJlcRIeCgp0b2tlbkNvdW50GAEgASgBUgp0b2tlbkNvdW50EhAKA2RpZBgCIAEoCVIDZGlk');
