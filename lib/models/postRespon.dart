import 'package:json_annotation/json_annotation.dart';
import "post.dart";
part 'postRespon.g.dart';

@JsonSerializable()
class PostRespon {
    PostRespon();
    List<Post> data ;
    
    factory PostRespon.fromJson(Map<String,dynamic> json) => _$PostResponFromJson(json);
    Map<String, dynamic> toJson() => _$PostResponToJson(this);
}
