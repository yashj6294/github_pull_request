import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:github_pull_request/models/pull_request.dart';
import 'package:github_pull_request/models/repository.dart';
import 'package:github_pull_request/networking/http_service.dart';

class PullRequestProvider extends ChangeNotifier {
  final HttpService _httpService = HttpService();

  List<PullRequest>? _pullRequests;
  List<PullRequest>? get pullRequests => _pullRequests;

  Future<bool> getPullRequests(Repository repository) async {
    _pullRequests = [];
    try {
      var response = await _httpService.getRequest(
          "repos/JakeWharton/${repository.name}/pulls?state=closed&per_page=100");
      if (response.statusCode == 200) {
        var pullrequestsData = response.data;
        for (var repositoryData in pullrequestsData) {
          PullRequest pullRequest = PullRequest.fromJson(repositoryData);
          _pullRequests!.add(pullRequest);
        }
      }
      notifyListeners();
      return true;
    } catch (e) {
      log(e.toString());
    }
    return false;
  }
}
