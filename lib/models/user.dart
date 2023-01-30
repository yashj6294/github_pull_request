import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "login")
  String username;

  @JsonKey(name: "avatar_url")
  String avatarUrl;

  User({
    required this.id,
    required this.avatarUrl,
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
