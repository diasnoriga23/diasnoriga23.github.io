import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portofolio/presentation/widget/list_experience_widget.dart';
import 'package:portofolio/utils/responsive_util.dart';

class WorkExperienceWidget extends StatefulWidget {
  const WorkExperienceWidget({super.key});

  @override
  State<WorkExperienceWidget> createState() => _WorkExperienceWidgetState();
}

class _WorkExperienceWidgetState extends State<WorkExperienceWidget> {
  List<dynamic> experiencesItem = [];
  List<dynamic> stackItem = [];

  @override
  void initState() {
    super.initState();
    _loadJsonExperience();
    _loadJsonStack();
  }

  Future<void> _loadJsonExperience() async {
    final String response = await rootBundle.loadString(
      'assets/experience.json',
    );
    final data = json.decode(response);
    setState(() {
      experiencesItem = data;
    });
  }

  Future<void> _loadJsonStack() async {
    final String response = await rootBundle.loadString('assets/stack.json');
    final data = json.decode(response);
    setState(() {
      stackItem = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 100),
      child: Column(
        children: [
          // Text(
          //   'Work Experience',
          //   style: context.titleTextStyle.copyWith(
          //     fontSize: context.fontSizeTitle,
          //   ),
          // ),
          // SizedBox(height: context.heihtContentTitle),
          Container(
            margin: EdgeInsets.symmetric(horizontal: context.paddingHorizontal),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: context.colorContainerContentImage,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Work Experience',
                  style: context.interTextStyle.copyWith(
                    fontSize: context.fontContainerTitle,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 50),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: experiencesItem.length,
                  itemBuilder: (context, index) {
                    var experience = experiencesItem[index];
                    return experienceItem(
                      image: experience['image'],
                      company: experience['company'],
                      time: experience['time'],
                      role: experience['role'],
                      description: experience['description'],
                      tag: experience['tech'].join(', '),
                      duration: experience['duration'],
                      context: context,
                    );
                  },
                ),
                // SizedBox(height: 50),
                // Wrap(
                //   spacing: 15,
                //   runSpacing: 15,
                //   children:
                //       (stackItem).map<Widget>((tag) {
                //         return Container(
                //           width: context.sizeImageTechStack,
                //           height: context.sizeImageTechStack,
                //           padding: EdgeInsets.symmetric(
                //             vertical: 3,
                //             horizontal: 5,
                //           ),
                //           decoration: BoxDecoration(
                //             color: context.colorContainerImage,
                //             borderRadius: BorderRadius.circular(10),
                //           ),
                //           child: Image.asset(tag['image'], fit: BoxFit.cover),
                //         );
                //       }).toList(),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
