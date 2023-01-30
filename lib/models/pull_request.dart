import 'package:github_pull_request/models/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'pull_request.g.dart';

@JsonSerializable()
class PullRequest {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "title")
  String title;

  @JsonKey(name: "user")
  User user;

  @JsonKey(name: "created_at")
  String createdAt;

  @JsonKey(name: "closed_at")
  String closedAt;

  PullRequest({
    required this.closedAt,
    required this.createdAt,
    required this.id,
    required this.title,
    required this.user,
  });
  factory PullRequest.fromJson(Map<String, dynamic> json) =>
      _$PullRequestFromJson(json);
}
