import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget iconSosmed({double spacing = 12}) {
  return Wrap(
    spacing: spacing,
    children: [
      sosmedIcon(
        'assets/ig.png',
        'https://www.instagram.com/sekadiasnorigakoswara',
      ),
      sosmedIcon(
        'assets/link.png',
        'https://www.linkedin.com/in/seka-diasnoriga-koswara-1740a8235',
      ),
      sosmedIcon('assets/git.png', 'https://github.com/diasnoriga23'),
    ],
  );
}

Widget sosmedIcon(String asset, String url) {
  return InkWell(
    onTap: () async {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    },
    child: Image.asset(asset, height: 35),
  );
}
