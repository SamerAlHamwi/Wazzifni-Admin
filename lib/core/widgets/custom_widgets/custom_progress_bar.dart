

import 'package:flutter/material.dart';

import '../../common/style/gaps.dart';
import '../../constants/app_textStyle.dart';
import '../../constants/appcolors.dart';


class CustomProgressBar extends StatelessWidget {
  const CustomProgressBar({super.key, required this.progress, required this.title});

  final int progress;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 100,
          child: Text(
              title,
              style: AppText.fontSizeSmallTextStyle.copyWith(
                fontWeight: FontWeight.w600,
              )
          ),
        ),
        Gaps.hGap2,
        Expanded(
          child: Stack(
            children: [
              Container(
                height: 16,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: AppColors.boxShadow2,
                ),
              ),
              FractionallySizedBox(
                widthFactor: progress / 10,
                child: Container(
                  height: 16,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        Gaps.hGap2,
        Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Text(
              "$progress/10",
              style: AppText.fontSizeSmallTextStyle
          ),
        ),
      ],
    );
  }
}