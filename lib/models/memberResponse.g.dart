// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memberResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberResponse _$MemberResponseFromJson(Map<String, dynamic> json) {
  return MemberResponse()
    ..success = json['success'] as bool
    ..data = json['data'] == null
        ? null
        : Member.fromJson(json['data'] as Map<String, dynamic>)
    ..message = json['message'] as String
    ..code = json['code'] as num;
}

Map<String, dynamic> _$MemberResponseToJson(MemberResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'code': instance.code
    };
