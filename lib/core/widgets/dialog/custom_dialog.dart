


import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wazzifni_admin/core/constants/app_assets.dart';
import 'package:wazzifni_admin/core/constants/app_textStyle.dart';
import 'package:wazzifni_admin/core/constants/appcolors.dart';

import '../../common/style/gaps.dart';

Future showCustomDialog({
      required BuildContext context,
      required String text,
      required VoidCallback onTapOK,
      required bool isWithCancel,
      VoidCallback? onTapCancel,
      Widget? child,
      bool? dismissible
    }) async {
  showDialog(
    context: context,
    barrierDismissible: dismissible ?? true,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColors.white,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
        content: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 80,
                height: 4.0,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(16.0)),
              ),
              Gaps.vGap2,
              Image.asset(
                AppAssets.logo,
                width: 150,
                height: 150,
              ),
              Gaps.vGap2,
              text.isNotEmpty ? Text(
                text,
                style: AppText.fontSizeMediumTextStyle,
                textAlign: TextAlign.center,
              ) : const SizedBox(),
              text.isNotEmpty ? const SizedBox(
                height: 8,
              ) : const SizedBox(),
              Gaps.vGap2,
              child ?? const SizedBox(),
              child != null ? const SizedBox(
                height: 12,
              ) : const SizedBox(),

              Row(
                mainAxisAlignment: isWithCancel ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.center,
                children: [
                  InfoCard(
                    width: 90,
                    color: AppColors.primaryColor,
                    textColor: AppColors.white,
                    title: 'ok'.tr(),
                    onTap: onTapOK,
                  ),
                  if(isWithCancel)
                    InfoCard(
                      width: 90,
                      color: AppColors.subWhite,
                      title: 'cancel'.tr(),
                      onTap: onTapCancel!,
                    )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      );
    },
  );
}


class InfoCard extends StatelessWidget {
  final double width;
  final Color color;
  final Color? textColor;
  final String title;
  final VoidCallback onTap;

  const InfoCard({super.key,
        required this.width,
        required this.color,
        this.textColor,
        required this.title,
        required this.onTap,
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: AppColors.boxShadow2,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            title.isNotEmpty
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: AppText.fontSizeMediumTextStyle.copyWith(
                      color: textColor ?? AppColors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ) : const SizedBox(),
          ],
        ),
      ),
    );
  }
}