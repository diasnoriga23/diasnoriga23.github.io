import 'package:flutter/material.dart';
import 'package:portofolio/presentation/widget/aboutme_widget.dart';
import 'package:portofolio/presentation/widget/work_experience_widget.dart';
import 'package:portofolio/presentation/widget/footer_widget.dart';
import 'package:portofolio/presentation/widget/introduction_widget.dart';
import 'package:portofolio/presentation/widget/my_projects_widget.dart';
import 'package:portofolio/presentation/widget/trusted_company_widget.dart';
import 'package:portofolio/utils/responsive_util.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late ScrollController _scrollController;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
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
                : WebSmoothScroll(
                  scrollSpeed: 2.1,
                  controller: _scrollController,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IntroductionWidget(scrollController: _scrollController),
                        MyProjectsWidget(),
                        TrustedCompanyWidget(),
                        AboutmeWidget(),
                        WorkExperienceWidget(),
                        FooterWidget(),
                      ],
                    ),
                  ),
                ),
      ),
    );
  }
}
