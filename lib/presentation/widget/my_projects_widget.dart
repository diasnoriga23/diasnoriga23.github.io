import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_tilt/flutter_tilt.dart';
import 'package:portofolio/presentation/widget/custome_button_widget.dart';
import 'package:portofolio/utils/responsive_util.dart';
import 'package:url_launcher/url_launcher.dart';

class MyProjectsWidget extends StatefulWidget {
  final bool isAllProject;
  const MyProjectsWidget({super.key, this.isAllProject = false});

  @override
  State<MyProjectsWidget> createState() => _MyProjectsWidgetState();
}

class _MyProjectsWidgetState extends State<MyProjectsWidget> {
  List<dynamic> portfolioItems = [];
  List<dynamic> limitedItems = [];

  @override
  void initState() {
    super.initState();
    _loadJson();
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

  @override
  Widget build(BuildContext context) {
    if (widget.isAllProject) {
      limitedItems = (portfolioItems).toList();
    } else {
      limitedItems = (portfolioItems).take(3).toList();
    }

    if (limitedItems.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Text(
            'MY PROJECTS',
            style: context.titleTextStyle.copyWith(
              fontSize: context.fontSizeTitle,
            ),
          ),
          SizedBox(height: context.heihtContentTitle),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.paddingHorizontal,
            ),
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
                      Tilt(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        shadowConfig: ShadowConfig(disable: true),
                        tiltConfig: TiltConfig(
                          angle: 6.0,
                          enableReverse: true,
                          enableGestureHover: true,
                          enableGestureTouch: true,
                          enableGestureSensors: false,
                          enableOutsideAreaMove: false,
                          moveDuration: Duration(milliseconds: 150),
                          leaveDuration: Duration(milliseconds: 300),
                          moveCurve: Curves.easeOut,
                          leaveCurve: Curves.easeOutBack,
                        ),

                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                          child: Container(
                            color: context.colorContainerImage,
                            child: AspectRatio(
                              aspectRatio: 3 / 2,
                              child:
                                  item['image'] == ''
                                      ? const SizedBox()
                                      : Image.asset(
                                        item['image'],
                                        fit: BoxFit.cover,
                                      ),
                            ),
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

                            // const SizedBox(height: 10),
                            // Align(
                            //   alignment: Alignment.centerLeft,
                            //   child: Wrap(
                            //     spacing: 8,
                            //     runSpacing: 8,
                            //     children:
                            //         (item['tag'] as List).map<Widget>((tag) {
                            //           return Container(
                            //             padding: EdgeInsets.symmetric(
                            //               vertical: 3,
                            //               horizontal: 5,
                            //             ),
                            //             decoration: BoxDecoration(
                            //               border: Border.all(
                            //                 color: Color(0xFFB7B8BC),
                            //               ),
                            //               borderRadius: BorderRadius.circular(
                            //                 6,
                            //               ),
                            //             ),
                            //             child: Text(
                            //               tag['name'],
                            //               style:
                            //                   context.subTitleTextStyle
                            //                       .copyWith(),
                            //             ),
                            //           );
                            //         }).toList(),
                            //   ),
                            // ),
                            const SizedBox(height: 16),
                            Wrap(
                              spacing: 16,
                              runSpacing: 16,
                              children: [
                                item['playStore'] == ''
                                    ? SizedBox(
                                      height: context.sizeImagePlayAppstore,
                                    )
                                    : InkWell(
                                      onTap: () async {
                                        final uri = Uri.parse(
                                          item['playStore'],
                                        );
                                        if (await canLaunchUrl(uri)) {
                                          await launchUrl(
                                            uri,
                                            mode:
                                                LaunchMode.externalApplication,
                                          );
                                        }
                                      },
                                      child: Image.asset(
                                        'assets/playstore.png',
                                        height: context.sizeImagePlayAppstore,
                                      ),
                                    ),
                                item['appStore'] == ''
                                    ? SizedBox(
                                      height: context.sizeImagePlayAppstore,
                                    )
                                    : InkWell(
                                      onTap: () async {
                                        final uri = Uri.parse(item['appStore']);
                                        if (await canLaunchUrl(uri)) {
                                          await launchUrl(
                                            uri,
                                            mode:
                                                LaunchMode.externalApplication,
                                          );
                                        }
                                      },
                                      child: Image.asset(
                                        'assets/appstore.png',
                                        height: context.sizeImagePlayAppstore,
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
          SizedBox(height: 25),

          widget.isAllProject
              ? SizedBox()
              : customButton(context, 'View More', navigate: true),
        ],
      ),
    );
  }
}
