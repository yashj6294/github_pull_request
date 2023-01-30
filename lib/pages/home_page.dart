import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:github_pull_request/models/repository.dart';
import 'package:github_pull_request/pages/repository_card.dart';
import 'package:github_pull_request/providers/repository_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Repositories',
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
                future: Provider.of<RepositoryProvider>(context, listen: false)
                    .getRepositories(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    );
                  }
                  return Consumer<RepositoryProvider>(
                    builder: (context, repositoryProvider, child) {
                      List<Repository> repositories =
                          repositoryProvider.repositories;
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            RepositoryCard(repository: repositories[index]),
                        itemCount: repositories.length,
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


/* 

Consumer<RepositoryProvider>(
          builder: (context, repositoryProvider, child) {
            if (repositoryProvider.repositories == null) {
              return const CircularProgressIndicator();
            }
            List<Repository> repositories = repositoryProvider.repositories!;
            return ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  RepositoryCard(repository: repositories[index]),
              itemCount: repositories.length,
            );
          },
        ),

*/