import 'package:flutter/material.dart';
import 'package:portofolio/utils/responsive_util.dart';

Widget experienceItem({
  required String image,
  required String company,
  required String time,
  required String role,
  required String description,
  required String tag,
  required String duration,
  required BuildContext context,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 32),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white38,
            shape: BoxShape.circle,
          ),
          child: Image.asset(image),
        ),
        SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                company,
                style: context.interTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(time, style: context.interTextStyle.copyWith(fontSize: 16)),
              const SizedBox(height: 4),
              Text(role, style: context.interTextStyle.copyWith(fontSize: 16)),
              const SizedBox(height: 8),
              Text(description, style: context.subTitleTextStyle.copyWith()),
              const SizedBox(height: 8),
              Text(tag, style: context.subTitleTextStyle.copyWith()),
              const SizedBox(height: 8),
              Text(duration, style: context.subTitleTextStyle.copyWith()),
            ],
          ),
        ),
      ],
    ),
  );
}
