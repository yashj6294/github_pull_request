import 'package:flutter/material.dart';
import 'package:github_pull_request/models/pull_request.dart';
import 'package:github_pull_request/models/repository.dart';
import 'package:intl/intl.dart';

class PullRequestCard extends StatelessWidget {
  final PullRequest pullRequest;
  const PullRequestCard({
    super.key,
    required this.pullRequest,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
              backgroundImage: NetworkImage(pullRequest.user.avatarUrl),
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
                    pullRequest.title,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Ubuntu',
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'by : ${pullRequest.user.username}',
                    style: const TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'Ubuntu',
                      color: Colors.black45,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Created At : ${getDate(pullRequest.createdAt)}",
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontFamily: 'Ubuntu',
                      color: Colors.black54,
                    ),
                    overflow: TextOverflow.clip,
                    maxLines: 2,
                  ),
                  Text(
                    "Closed At : ${getDate(pullRequest.closedAt)}",
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
    );
  }

  String getDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    return "${DateFormat.jm().format(dateTime)} ${DateFormat.yMMMd().format(dateTime)}";
  }
}
