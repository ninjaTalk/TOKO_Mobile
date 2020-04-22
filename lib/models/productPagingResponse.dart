import 'package:json_annotation/json_annotation.dart';
import "product.dart";
part 'productPagingResponse.g.dart';

@JsonSerializable()
class ProductPagingResponse {
    ProductPagingResponse();

    bool success;
    List<Product> data;
    String message;
    num code;
    
    factory ProductPagingResponse.fromJson(Map<String,dynamic> json) => _$ProductPagingResponseFromJson(json);
    Map<String, dynamic> toJson() => _$ProductPagingResponseToJson(this);
}
