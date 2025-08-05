import 'package:flutter/material.dart';
import 'package:portofolio/presentation/widget/aboutme_widget.dart';
import 'package:portofolio/presentation/widget/work_experience_widget.dart';
import 'package:portofolio/presentation/widget/footer_widget.dart';
import 'package:portofolio/presentation/widget/introduction_widget.dart';
import 'package:portofolio/presentation/widget/my_projects_widget.dart';
import 'package:portofolio/presentation/widget/trusted_company_widget.dart';
import 'package:portofolio/utils/responsive_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  // final GlobalKey _helloKey = GlobalKey();
  // final GlobalKey _portfolioKey = GlobalKey();
  // final GlobalKey _trustCompanyKey = GlobalKey();
  // final GlobalKey _aboutMeKey = GlobalKey();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: context.colorBackground,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child:
            isLoading
                ? const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                )
                : SingleChildScrollView(
                  controller: _scrollController,
                  physics: ClampingScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IntroductionWidget(),
                      MyProjectsWidget(),
                      TrustedCompanyWidget(),
                      AboutmeWidget(),
                      WorkExperienceWidget(),
                      FooterWidget(),
                    ],
                  ),
                ),
      ),
    );
  }
}
