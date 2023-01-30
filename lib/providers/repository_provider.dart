import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:github_pull_request/models/repository.dart';
import 'package:github_pull_request/networking/http_service.dart';

class RepositoryProvider extends ChangeNotifier {
  final HttpService _httpService = HttpService();
  final List<Repository> _repositories = [];
  List<Repository> get repositories => _repositories;
  Future<bool> getRepositories() async {
    try {
      var response = await _httpService.getRequest("users/JakeWharton/repos?per_page=100");
      if (response.statusCode == 200) {
        var repositoriesData = response.data;
        for (var repositoryData in repositoriesData) {
          Repository repository = Repository.fromJson(repositoryData);
          _repositories.add(repository);
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
