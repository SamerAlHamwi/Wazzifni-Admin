

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wazzifni_admin/core/common/style/gaps.dart';
import 'package:wazzifni_admin/core/common/style/padding_insets.dart';
import 'package:wazzifni_admin/core/constants/app_assets.dart';
import 'package:wazzifni_admin/core/constants/app_textStyle.dart';
import 'package:wazzifni_admin/core/constants/appcolors.dart';


class HomeStatistics extends StatelessWidget {
  const HomeStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingInsets.bigPaddingAll,
      child: Wrap(
        children: [
          HomeStatisticsWidget(
            title: 'today_users'.tr(),
            subTitle: '9/1081',
            iconPath: AppAssets.employees,
          ),
          HomeStatisticsWidget(
            title: 'today_jobs'.tr(),
            subTitle: '13/250',
            iconPath: AppAssets.jobs,
          ),
          HomeStatisticsWidget(
            title: 'paid_jobs'.tr(),
            subTitle: '8/128',
            iconPath: AppAssets.paid,
          ),
          HomeStatisticsWidget(
            title: 'users_found_job'.tr(),
            subTitle: '6/90',
            iconPath: AppAssets.featured,
          ),
        ],
      ),
    );
  }
}



class HomeStatisticsWidget extends StatelessWidget {
  const HomeStatisticsWidget({super.key, required this.title, required this.subTitle, required this.iconPath});

  final String title,subTitle,iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 268,
      margin: PaddingInsets.lowPaddingAll,
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: AppColors.primaryGradient,
      ),
      child: Container(
        padding: PaddingInsets.bigPaddingAll,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Image.asset(
                  iconPath,
                  width: 40,
                  height: 40,
                ),
                Gaps.hGap1,
                Text(
                  title,
                  style: AppText.fontSizeMediumTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.hGap2,
              ],
            ),
            Gaps.vGap2,
            Text(
              subTitle,
              style: AppText.fontSizeExtraLargeTextStyle.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
