import 'package:flutter/material.dart';
import 'package:portofolio/presentation/widget/aboutme_widget.dart';
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
      // appBar: _buildNavbar(),
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
                  // padding: EdgeInsets.symmetric(vertical: 50),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IntroductionWidget(),
                      MyProjectsWidget(),
                      TrustedCompanyWidget(),
                      AboutmeWidget(),
                      FooterWidget(),
                    ],
                  ),
                ),
      ),
    );
  }

  // void _scrollToKey(GlobalKey key) {
  //   final context = key.currentContext;
  //   if (context != null) {
  //     Scrollable.ensureVisible(
  //       context,
  //       duration: const Duration(milliseconds: 500),
  //       curve: Curves.easeInOut,
  //     );
  //   }
  // }

  // PreferredSizeWidget _buildNavbar() {
  //   return PreferredSize(
  //     preferredSize: const Size.fromHeight(kToolbarHeight),
  //     child: Stack(
  //       children: [
  //         // Blur layer
  //         Positioned.fill(
  //           child: ClipRect(
  //             child: BackdropFilter(
  //               filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
  //               // ignore: deprecated_member_use
  //               child: Container(color: Color(0xFF222531).withOpacity(0.5)),
  //             ),
  //           ),
  //         ),

  //         // AppBar content
  //         AppBar(
  //           // ignore: deprecated_member_use
  //           backgroundColor: Color(0xFF222531).withOpacity(0.5),
  //           elevation: 0,
  //           automaticallyImplyLeading: false,
  //           title: Row(
  //             mainAxisAlignment: MainAxisAlignment.end,
  //             children: [
  //               TextButton(
  //                 onPressed: () => _scrollToKey(_helloKey),
  //                 child: Text('Home', style: context.interTextStyle),
  //               ),
  //               TextButton(
  //                 onPressed: () => _scrollToKey(_portfolioKey),
  //                 child: Text(
  //                   'Portfolio',
  //                   style: context.interTextStyle.copyWith(color: Colors.white),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
