import 'package:flutter/material.dart';

class GithubStatusCard extends StatelessWidget {
  const GithubStatusCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: const [
                Text("Repos"),
                Text(
                  "18",
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
            Column(
              children: const [
                Text("Repos"),
                Text(
                  "18",
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
            Column(
              children: const [
                Text("Repos"),
                Text(
                  "18",
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
