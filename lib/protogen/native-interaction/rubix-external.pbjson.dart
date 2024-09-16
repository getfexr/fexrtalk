///
//  Generated code. Do not modify.
//  source: native-interaction/rubix-external.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use authRequestDescriptor instead')
const AuthRequest$json = const {
  '1': 'AuthRequest',
  '2': const [
    const {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
  ],
};

/// Descriptor for `AuthRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authRequestDescriptor = $convert.base64Decode('CgtBdXRoUmVxdWVzdBISCgR1dWlkGAEgASgJUgR1dWlk');
@$core.Deprecated('Use orgAuthRequestDescriptor instead')
const OrgAuthRequest$json = const {
  '1': 'OrgAuthRequest',
  '2': const [
    const {'1': 'orgName', '3': 1, '4': 1, '5': 9, '10': 'orgName'},
    const {'1': 'callBackUrl', '3': 2, '4': 1, '5': 9, '10': 'callBackUrl'},
    const {'1': 'sessionId', '3': 3, '4': 1, '5': 9, '10': 'sessionId'},
  ],
};

/// Descriptor for `OrgAuthRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List orgAuthRequestDescriptor = $convert.base64Decode('Cg5PcmdBdXRoUmVxdWVzdBIYCgdvcmdOYW1lGAEgASgJUgdvcmdOYW1lEiAKC2NhbGxCYWNrVXJsGAIgASgJUgtjYWxsQmFja1VybBIcCglzZXNzaW9uSWQYAyABKAlSCXNlc3Npb25JZA==');
@$core.Deprecated('Use orgStatusDescriptor instead')
const OrgStatus$json = const {
  '1': 'OrgStatus',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
  ],
};

/// Descriptor for `OrgStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List orgStatusDescriptor = $convert.base64Decode('CglPcmdTdGF0dXMSFgoGc3RhdHVzGAEgASgIUgZzdGF0dXM=');
@$core.Deprecated('Use txnRequestDescriptor instead')
const TxnRequest$json = const {
  '1': 'TxnRequest',
  '2': const [
    const {'1': 'receiver', '3': 1, '4': 1, '5': 9, '10': 'receiver'},
    const {'1': 'amount', '3': 2, '4': 1, '5': 1, '10': 'amount'},
    const {'1': 'comment', '3': 3, '4': 1, '5': 9, '10': 'comment'},
    const {'1': 'type', '3': 4, '4': 1, '5': 5, '10': 'type'},
    const {'1': 'purpose', '3': 5, '4': 1, '5': 9, '10': 'purpose'},
    const {'1': 'externalParty', '3': 6, '4': 1, '5': 9, '10': 'externalParty'},
    const {'1': 'ticker', '3': 7, '4': 1, '5': 9, '10': 'ticker'},
  ],
};

/// Descriptor for `TxnRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List txnRequestDescriptor = $convert.base64Decode('CgpUeG5SZXF1ZXN0EhoKCHJlY2VpdmVyGAEgASgJUghyZWNlaXZlchIWCgZhbW91bnQYAiABKAFSBmFtb3VudBIYCgdjb21tZW50GAMgASgJUgdjb21tZW50EhIKBHR5cGUYBCABKAVSBHR5cGUSGAoHcHVycG9zZRgFIAEoCVIHcHVycG9zZRIkCg1leHRlcm5hbFBhcnR5GAYgASgJUg1leHRlcm5hbFBhcnR5EhYKBnRpY2tlchgHIAEoCVIGdGlja2Vy');
