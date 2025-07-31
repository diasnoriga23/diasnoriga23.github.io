import 'package:flutter/material.dart';
import 'package:portofolio/utils/responsive_util.dart';

class AboutmeWidget extends StatelessWidget {
  const AboutmeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 150, bottom: 150),
      child: Column(
        children: [
          Text(
            'ABOUT ME',
            style: context.titleTextStyle.copyWith(
              fontSize: context.fontSizeTitle,
            ),
          ),
          SizedBox(height: context.heihtContentTitle),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.paddingHorizontal,
            ),
            child: Text(
              'Hello, I am a graduate of the Faculty of Engineering and Computer Science, majoring in Information Systems. I currently work as a Mobile Flutter Developer and have been involved in various application projects for both private companies and government institutions. I possess strong skills in Dart programming and the Flutter framework to build efficient and responsive applications.',
              style: context.subTitleTextStyle.copyWith(
                fontSize: context.fontSizeSubTitle,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
