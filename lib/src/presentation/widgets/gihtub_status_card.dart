import 'package:flutter/material.dart';
import 'package:github_user_search_app/src/data/models/gihub_user.model.dart';

class GithubStatusCard extends StatelessWidget {
  const GithubStatusCard({
    super.key,
    required this.githubUser,
  });

  final GithubUser githubUser;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Text("Repos"),
                Text(
                  "${githubUser.publicRepos}",
                  style: const TextStyle(fontSize: 18),
                )
              ],
            ),
            Column(
              children: [
                const Text("Followers"),
                Text(
                  "${githubUser.followers}",
                  style: const TextStyle(fontSize: 18),
                )
              ],
            ),
            Column(
              children: [
                const Text("Following"),
                Text(
                  "${githubUser.following}",
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
