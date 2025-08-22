import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:portofolio/presentation/widget/custome_button_widget.dart';
import 'package:portofolio/utils/responsive_util.dart';

class IntroductionWidget extends StatefulWidget {
  final ScrollController scrollController;
  const IntroductionWidget({super.key, required this.scrollController});

  @override
  State<IntroductionWidget> createState() => _IntroductionWidgetState();
}

class _IntroductionWidgetState extends State<IntroductionWidget>
    with SingleTickerProviderStateMixin {
  double _opacity = 1.0;

  late AnimationController _arrowController;
  late Animation<Offset> _arrowAnimation;

  List<String> phrases = [
    "Seka Diasnoriga Koswara",
    "Mobile App Developer",
    "Freelance",
    "4 Years Experience",
    "Based in Sumedang",
  ];

  @override
  void initState() {
    super.initState();

    _arrowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);

    _arrowAnimation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(0, 0.2),
    ).animate(
      CurvedAnimation(parent: _arrowController, curve: Curves.easeInOut),
    );

    widget.scrollController.addListener(() {
      final offset = widget.scrollController.offset;
      setState(() {
        _opacity = offset < 50 ? 1.0 : 0.0;
      });
    });
  }

  @override
  void dispose() {
    _arrowController.dispose();
    widget.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello, I\'m',
                style: context.interTextStyle.copyWith(
                  fontSize: context.fontAnimasiSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              AnimatedTextKit(
                animatedTexts:
                    phrases
                        .map(
                          (text) => TyperAnimatedText(
                            text,
                            textStyle: context.interTextStyle.copyWith(
                              fontSize: context.fontAnimasiSize,
                            ),
                            textAlign: TextAlign.center,
                            speed: const Duration(milliseconds: 100),
                          ),
                        )
                        .toList(),
                repeatForever: true,
              ),
              const SizedBox(height: 45),
              customButton(context, 'View My Projects', navigate: true),
            ],
          ),
          Positioned(
            bottom: 40,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: _opacity,
              child: Column(
                children: [
                  SlideTransition(
                    position: _arrowAnimation,
                    child: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 30,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Scroll Down',
                    style: context.interTextStyle.copyWith(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
