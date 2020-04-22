// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Member _$MemberFromJson(Map<String, dynamic> json) {
  return Member()
    ..token = json['token'] as String
    ..name = json['name'] as String;
}

Map<String, dynamic> _$MemberToJson(Member instance) =>
    <String, dynamic>{'token': instance.token, 'name': instance.name};
