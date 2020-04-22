// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productPagingResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductPagingResponse _$ProductPagingResponseFromJson(
    Map<String, dynamic> json) {
  return ProductPagingResponse()
    ..success = json['success'] as bool
    ..data = (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Product.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..message = json['message'] as String
    ..code = json['code'] as num;
}

Map<String, dynamic> _$ProductPagingResponseToJson(
        ProductPagingResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'code': instance.code
    };
