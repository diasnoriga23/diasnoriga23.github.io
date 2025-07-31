import 'package:flutter/material.dart';
import 'package:portofolio/presentation/widget/custome_button_widget.dart';
import 'package:portofolio/presentation/widget/icon_sosmed_widget.dart';
import 'package:portofolio/utils/responsive_util.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorBackgroundFooter,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
        top: 80,
        bottom: 30,
        left: context.paddingHorizontal,
        right: context.paddingHorizontal,
      ),
      child: Column(
        spacing: 80,
        children: [
          Wrap(
            spacing: 200,
            runSpacing: 60,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 30,
                children: [
                  Text(
                    'Seka Diasnoriga Koswara',
                    style: context.interTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  customButton(
                    context,
                    'Download CV',
                    url: 'https://www.cake.me/seka-diasnoriga-koswara',
                  ),
                  iconSosmed(spacing: 30),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 25,
                children: [
                  Text(
                    'Contact',
                    style: context.interTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () async {
                          final uri = Uri.parse(
                            'mailto:diasnorigakoswaraseka@gmail.com',
                          );
                          if (await canLaunchUrl(uri)) {
                            await launchUrl(
                              uri,
                              mode: LaunchMode.externalApplication,
                            );
                          }
                        },
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all(EdgeInsets.zero),
                          minimumSize: WidgetStateProperty.all(Size.zero),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          alignment:
                              Alignment.centerLeft, // opsional: agar rata kiri
                        ),
                        child: Text(
                          'diasnorigakoswaraseka@gmail.com',
                          style: context.interTextStyle.copyWith(fontSize: 14),
                        ),
                      ),

                      Text(
                        'Sumedang, West Java, Indonesia',
                        style: context.interTextStyle.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          Text(
            '© Copyright 2023 - SDK',
            style: context.interTextStyle.copyWith(fontSize: 12.5),
          ),
        ],
      ),
    );
  }
}
