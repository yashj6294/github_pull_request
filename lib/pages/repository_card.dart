import 'package:flutter/material.dart';
import 'package:github_pull_request/models/repository.dart';
import 'package:github_pull_request/pages/pull_request_page.dart';

class RepositoryCard extends StatelessWidget {
  final Repository repository;
  const RepositoryCard({
    super.key,
    required this.repository,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => PullRequestPage(repository: repository),
        ),
      ),
      child: Card(
        color: const Color.fromARGB(255, 211, 211, 211),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(repository.user.avatarUrl),
                radius: 30.0,
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      repository.name,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Ubuntu',
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'by : ${repository.user.username}',
                      style: const TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'Ubuntu',
                        color: Colors.black45,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      repository.description,
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'Ubuntu',
                        color: Colors.black54,
                      ),
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
