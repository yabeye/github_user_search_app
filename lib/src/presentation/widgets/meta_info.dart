import 'package:flutter/material.dart';
import 'package:github_user_search_app/src/data/models/gihub_user.model.dart';

class MetaInfo extends StatelessWidget {
  const MetaInfo({
    super.key,
    required this.githubUser,
  });

  final GithubUser githubUser;

  @override
  Widget build(BuildContext context) {
    print("Blog: $githubUser");
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoText(
                iconData: Icons.location_on,
                label: githubUser.location,
              ),
              const SizedBox(height: 15),
              InfoText(
                iconData: Icons.south_america_outlined,
                label: githubUser.blog,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoText(
                iconData: Icons.link,
                label: githubUser.twitterUsername,
              ),
              const SizedBox(height: 15),
              const InfoText(
                iconData: Icons.maps_home_work_outlined,
                label: "@github",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class InfoText extends StatelessWidget {
  const InfoText({
    super.key,
    required this.iconData,
    this.label,
  });

  final IconData iconData;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          color: label == null ? Colors.grey : Colors.white,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label ?? "Not available",
            style: TextStyle(
              color: label == null ? Colors.grey : Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
