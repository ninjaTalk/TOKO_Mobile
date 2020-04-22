// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postRespon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostRespon _$PostResponFromJson(Map<String, dynamic> json) {
  return PostRespon()
    ..data = (json['data'] as List)
        ?.map(
            (e) => e == null ? null : Post.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$PostResponToJson(PostRespon instance) =>
    <String, dynamic>{'data': instance.data};
