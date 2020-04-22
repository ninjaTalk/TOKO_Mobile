import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
    Product();

    num id;
    String name;
    String detail;
    String image;
    String created_at;
    String updated_at;
    
    factory Product.fromJson(Map<String,dynamic> json) => _$ProductFromJson(json);
    Map<String, dynamic> toJson() => _$ProductToJson(this);
}
