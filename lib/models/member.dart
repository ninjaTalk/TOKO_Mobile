import 'package:json_annotation/json_annotation.dart';

part 'member.g.dart';

@JsonSerializable()
class Member {
    Member();

    String token;
    String name;
    
    factory Member.fromJson(Map<String,dynamic> json) => _$MemberFromJson(json);
    Map<String, dynamic> toJson() => _$MemberToJson(this);
}
