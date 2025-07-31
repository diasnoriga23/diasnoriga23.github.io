import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_infinite_marquee/flutter_infinite_marquee.dart';
import 'package:portofolio/utils/responsive_util.dart';

class TrustedCompanyWidget extends StatefulWidget {
  const TrustedCompanyWidget({super.key});

  @override
  State<TrustedCompanyWidget> createState() => _TrustedCompanyWidgetState();
}

class _TrustedCompanyWidgetState extends State<TrustedCompanyWidget> {
  List<dynamic> trustCompany = [];

  @override
  void initState() {
    super.initState();
    _loadJsonCompany();
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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 150),
      child: Column(
        children: [
          Text(
            'Trusted by Companies',
            style: context.titleTextStyle.copyWith(
              fontSize: context.fontSizeTitle,
            ),
          ),
          SizedBox(height: context.heihtContentTitle),
          SizedBox(
            height: context.sizeImageMarquee,
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
                  width: context.sizeImageMarquee,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
