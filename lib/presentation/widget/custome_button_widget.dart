import 'package:flutter/material.dart';
import 'package:portofolio/presentation/page/all_project_page.dart';
import 'package:portofolio/utils/responsive_util.dart';
import 'package:url_launcher/url_launcher.dart';

Widget customButton(
  BuildContext context,
  String text, {
  String url = '',
  bool navigate = false,
}) {
  return ElevatedButton(
    onPressed: () async {
      if (navigate) {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder:
                (context, animation, secondaryAnimation) => AllProjectPage(),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              return FadeTransition(opacity: animation, child: child);
            },
            transitionDuration: Duration(milliseconds: 300),
          ),
        );
      } else {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      }
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: context.colorButton,
      padding: EdgeInsets.symmetric(
        horizontal: context.paddingButtonHorizontal,
        vertical: context.paddingButtonVertical,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0,
    ),
    child: Text(
      text,
      style: context.interTextStyle.copyWith(
        fontSize: context.fontButtonSize,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
