import 'package:github_pull_request/models/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'repository.g.dart';

@JsonSerializable()
class Repository {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "name")
  String name;

  @JsonKey(name: "description")
  String description;

  @JsonKey(name: "html_url")
  String htmlUrl;

  @JsonKey(name: "owner")
  User user;

  Repository({
    required this.description,
    required this.htmlUrl,
    required this.id,
    required this.name,
    required this.user,
  });
  factory Repository.fromJson(Map<String, dynamic> json) =>
      _$RepositoryFromJson(json);
}
