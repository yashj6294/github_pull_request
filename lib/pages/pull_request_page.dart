import 'package:flutter/material.dart';
import 'package:github_pull_request/models/pull_request.dart';
import 'package:github_pull_request/models/repository.dart';
import 'package:github_pull_request/pages/pull_request_card.dart';
import 'package:github_pull_request/providers/pull_request_provider.dart';
import 'package:github_pull_request/providers/repository_provider.dart';
import 'package:provider/provider.dart';

class PullRequestPage extends StatelessWidget {
  final Repository repository;
  const PullRequestPage({
    super.key,
    required this.repository,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: const Text(
          'Github Pull Request',
          style: TextStyle(color: Colors.white, fontFamily: 'Ubuntu'),
        ),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Pull Requests',
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 24.0,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              FutureBuilder(
                future: Provider.of<PullRequestProvider>(context, listen: false)
                    .getPullRequests(repository),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    );
                  }
                  return Consumer<PullRequestProvider>(
                    builder: (context, pullRequestProvider, child) {
                      if (pullRequestProvider.pullRequests == null) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        );
                      }
                      List<PullRequest> pullRequests =
                          pullRequestProvider.pullRequests!;
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            PullRequestCard(pullRequest: pullRequests[index]),
                        itemCount: pullRequests.length,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
