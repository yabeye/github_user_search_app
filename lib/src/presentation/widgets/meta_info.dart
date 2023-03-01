import 'package:flutter/material.dart';

class MetaInfo extends StatelessWidget {
  const MetaInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              InfoText(
                iconData: Icons.location_on,
                label: "Addis Ababa",
              ),
              SizedBox(height: 15),
              InfoText(
                iconData: Icons.south_america_outlined,
                label: "twitter link here",
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              InfoText(
                iconData: Icons.link,
                label: "github link her3",
              ),
              SizedBox(height: 15),
              InfoText(
                iconData: Icons.maps_home_work_outlined,
                // label: "@github",
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
