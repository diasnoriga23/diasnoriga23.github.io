import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portofolio/presentation/widget/custome_button_widget.dart';
import 'package:portofolio/utils/responsive_util.dart';

class IntroductionWidget extends StatelessWidget {
  const IntroductionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> phrases = [
      "Seka Diasnoriga Koswara",
      "4 Years Experience",
      "Mobile App Developer",
      "Freelancer",
      "Based in Sumedang",
    ];

    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height,
      ),
      child: Stack(
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
              const SizedBox(height: 10),

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
              // const SizedBox(height: 20),
              // iconSosmed(),
              const SizedBox(height: 45),
              customButton(context, 'View My Projects', navigate: true),
            ],
          ),
        ],
      ),
    );
  }
}
