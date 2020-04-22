import 'package:json_annotation/json_annotation.dart';
import "member.dart";
part 'memberResponse.g.dart';

@JsonSerializable()
class MemberResponse {
    MemberResponse();

    bool success;
    Member data;
    String message;
    num code;
    
    factory MemberResponse.fromJson(Map<String,dynamic> json) => _$MemberResponseFromJson(json);
    Map<String, dynamic> toJson() => _$MemberResponseToJson(this);
}
