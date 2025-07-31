import 'dart:convert';
import 'dart:ui';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_infinite_marquee/flutter_infinite_marquee.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lottie/lottie.dart';
import 'package:portofolio/utils/responsive_util.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portofolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
      ),

      builder:
          (context, child) => ResponsiveBreakpoints.builder(
            child: BouncingScrollWrapper.builder(context, child!),
            breakpoints: [
              const Breakpoint(start: 0, end: 740, name: MOBILE),
              const Breakpoint(start: 741, end: 1350, name: TABLET),
              const Breakpoint(start: 1351, end: 1439, name: DESKTOP),
              const Breakpoint(start: 1440, end: double.infinity, name: '4K'),
            ],
          ),
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage>
    with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _helloKey = GlobalKey();
  final GlobalKey _portfolioKey = GlobalKey();
  final GlobalKey _trustCompanyKey = GlobalKey();
  final GlobalKey _aboutMeKey = GlobalKey();
  bool isLoading = true;

  List<dynamic> portfolioItems = [];
  List<dynamic> trustCompany = [];

  @override
  void initState() {
    super.initState();
    _loadJson();
    _loadJsonCompany();
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });
  }

  Future<void> _loadJson() async {
    final String response = await rootBundle.loadString(
      'assets/portofolio.json',
    );
    final data = json.decode(response);
    setState(() {
      portfolioItems = data;
    });
  }

  Future<void> _loadJsonCompany() async {
    final String response = await rootBundle.loadString(
      'assets/trustCompany.json',
    );
    final data = json.decode(response);
    setState(() {
      trustCompany = data;
    });
  }

  List<String> phrases = [
    "Seka Diasnoriga Koswara",
    "4 Years Experience",
    "Mobile App Developer",
    "Freelancer",
    "Based in Sumedang",
  ];
  Widget _buildMyPortofolio(BuildContext context) {
    final limitedItems = (portfolioItems).take(3).toList();

    if (limitedItems.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      key: _portfolioKey,
      children: [
        Text(
          'MY PORTOFOLIO',
          style: context.titleTextStyle.copyWith(
            fontSize: context.fontSizeTitle,
          ),
        ),
        SizedBox(height: context.heihtContentTitle),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.paddingHorizontal),
          child: MasonryGridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: context.crossAxisCount,
            ),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            itemCount: limitedItems.length,
            itemBuilder: (context, index) {
              final item = limitedItems[index];
              return Card(
                color: context.colorContainerContentImage,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: Container(
                        color: context.colorContainerImage,
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Image.asset(item['image'], fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['title'],
                            maxLines: 1,
                            style: context.interTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            height: 70,
                            child: Text(
                              item['description'],
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: context.subTitleTextStyle.copyWith(),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Wrap(
                            spacing: 16,
                            runSpacing: 16,
                            children: [
                              if (item['playStore'] != '')
                                InkWell(
                                  onTap: () async {
                                    final uri = Uri.parse(item['playStore']);
                                    if (await canLaunchUrl(uri)) {
                                      await launchUrl(
                                        uri,
                                        mode: LaunchMode.externalApplication,
                                      );
                                    }
                                  },
                                  child: Image.asset(
                                    'assets/playstore.png',
                                    height:
                                        ResponsiveValue<double>(
                                          context,
                                          defaultValue: 30,
                                          conditionalValues: const [
                                            Condition.largerThan(
                                              name: MOBILE,
                                              value: 35,
                                            ),
                                            Condition.largerThan(
                                              name: TABLET,
                                              value: 40,
                                            ),
                                            Condition.largerThan(
                                              name: DESKTOP,
                                              value: 40,
                                            ),
                                          ],
                                        ).value,
                                  ),
                                ),
                              if (item['appStore'] != '')
                                InkWell(
                                  onTap: () async {
                                    final uri = Uri.parse(item['appStore']);
                                    if (await canLaunchUrl(uri)) {
                                      await launchUrl(
                                        uri,
                                        mode: LaunchMode.externalApplication,
                                      );
                                    }
                                  },
                                  child: Image.asset(
                                    'assets/appstore.png',
                                    height:
                                        ResponsiveValue<double>(
                                          context,
                                          defaultValue: 30,
                                          conditionalValues: const [
                                            Condition.largerThan(
                                              name: MOBILE,
                                              value: 35,
                                            ),
                                            Condition.largerThan(
                                              name: TABLET,
                                              value: 40,
                                            ),
                                            Condition.largerThan(
                                              name: DESKTOP,
                                              value: 40,
                                            ),
                                          ],
                                        ).value,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _iconSosmed() {
    return Wrap(
      spacing: 12,
      children: [
        _sosmedIcon(
          'assets/ig.png',
          'https://www.instagram.com/sekadiasnorigakoswara',
        ),
        _sosmedIcon(
          'assets/link.png',
          'https://www.linkedin.com/in/seka-diasnoriga-koswara-1740a8235',
        ),
        _sosmedIcon('assets/git.png', 'https://github.com/diasnoriga23'),
      ],
    );
  }

  Widget _sosmedIcon(String asset, String url) {
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

  Widget _buttonCv(double subTitleSize) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: [
        _customButton(
          'Download CV',
          'https://www.cake.me/seka-diasnoriga-koswara',
          subTitleSize,
        ),
        // _customButton(
        //   "Let's Talk",
        //   'mailto:diasnorigakoswaraseka@.gmail.com',
        //   subTitleSize,
        // ),
      ],
    );
  }

  Widget _customButton(String text, String url, double size) {
    return ElevatedButton(
      onPressed: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: context.colorButton,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 0,
      ),
      child: Text(
        text,
        style: context.interTextStyle.copyWith(
          fontSize: size,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildCardMarquee() {
    return Column(
      key: _trustCompanyKey,
      children: [
        Text(
          'Trusted by Companies',
          style: context.titleTextStyle.copyWith(
            fontSize: context.fontSizeTitle,
          ),
        ),
        SizedBox(height: context.heihtContentTitle),
        SizedBox(
          height:
              ResponsiveValue<double>(
                context,
                defaultValue: 100,
                conditionalValues: const [
                  Condition.largerThan(name: MOBILE, value: 150),
                  Condition.largerThan(name: TABLET, value: 200),
                  Condition.largerThan(name: DESKTOP, value: 200),
                ],
              ).value,
          child: InfiniteMarquee(
            scrollDirection: Axis.horizontal,
            stepOffset: -0.75,
            itemBuilder: (BuildContext context, int index) {
              final item =
                  trustCompany[index % trustCompany.length]; // loop data
              return Image.asset(
                item['image'],
                fit: BoxFit.cover,
                colorBlendMode: BlendMode.hardLight,
                width:
                    ResponsiveValue<double>(
                      context,
                      defaultValue: 100,
                      conditionalValues: const [
                        Condition.largerThan(name: MOBILE, value: 150),
                        Condition.largerThan(name: TABLET, value: 200),
                        Condition.largerThan(name: DESKTOP, value: 200),
                      ],
                    ).value,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _aboutMe() {
    return Column(
      key: _aboutMeKey,
      children: [
        Text(
          'ABOUT ME',
          style: context.titleTextStyle.copyWith(
            fontSize: context.fontSizeTitle,
          ),
        ),
        SizedBox(height: context.heihtContentTitle),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.paddingHorizontal),
          child: Text(
            'Hello, I am a graduate of the Faculty of Engineering and Computer Science, majoring in Information Systems. I currently work as a Mobile Flutter Developer and have been involved in various application projects for both private companies and government institutions. I possess strong skills in Dart programming and the Flutter framework to build efficient and responsive applications.',
            style: context.subTitleTextStyle.copyWith(
              fontSize: context.fontSizeSubTitle,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _hello() {
    return Stack(
      key: _helloKey,
      alignment: Alignment.center,
      children: [
        Lottie.asset(
          'assets/animasi.json',
          repeat: true,
          fit: BoxFit.cover,
          width: 700,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Hello, I\'m',
              style: context.interTextStyle.copyWith(
                fontSize: context.fontAnimasiSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            AnimatedTextKit(
              animatedTexts:
                  phrases
                      .map(
                        (text) => TyperAnimatedText(
                          text,
                          textStyle: context.interTextStyle.copyWith(
                            fontSize: context.fontAnimasiSize,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.center,
                          speed: const Duration(milliseconds: 100),
                        ),
                      )
                      .toList(),
              repeatForever: true,
            ),
            const SizedBox(height: 20),
            _iconSosmed(),
            const SizedBox(height: 30),
            _buttonCv(context.fontButtonSize),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFF222531),
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
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _hello(),
                      const SizedBox(height: 100),
                      _buildMyPortofolio(context),
                      const SizedBox(height: 100),
                      _buildCardMarquee(),
                      const SizedBox(height: 100),
                      _aboutMe(),
                    ],
                  ),
                ),
      ),
    );
  }

  void _scrollToKey(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  PreferredSizeWidget _buildNavbar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: Stack(
        children: [
          // Blur layer
          Positioned.fill(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                // ignore: deprecated_member_use
                child: Container(color: Color(0xFF222531).withOpacity(0.5)),
              ),
            ),
          ),

          // AppBar content
          AppBar(
            // ignore: deprecated_member_use
            backgroundColor: Color(0xFF222531).withOpacity(0.5),
            elevation: 0,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => _scrollToKey(_helloKey),
                  child: Text('Home', style: context.interTextStyle),
                ),
                TextButton(
                  onPressed: () => _scrollToKey(_portfolioKey),
                  child: Text(
                    'Portfolio',
                    style: context.interTextStyle.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
