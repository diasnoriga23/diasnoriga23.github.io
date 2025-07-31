import 'package:flutter/material.dart';
import 'package:portofolio/presentation/widget/my_projects_widget.dart';
import 'package:portofolio/utils/responsive_util.dart';

class AllProjectPage extends StatelessWidget {
  const AllProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorBackground,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 50),
        child: MyProjectsWidget(isAllProject: true),
      ),
    );
  }
}
