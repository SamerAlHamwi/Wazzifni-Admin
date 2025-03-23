


import 'package:flutter/material.dart';
import 'package:wazzifni_admin/core/common/style/gaps.dart';
import 'package:wazzifni_admin/core/common/style/padding_insets.dart';
import 'package:wazzifni_admin/core/constants/appcolors.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_textStyle.dart';


class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: PaddingInsets.cardPaddingHV,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.darkPrimaryColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppColors.boxShadow2,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              AppAssets.companyLogo,
              height: 48,
              width: 48,
              fit: BoxFit.cover,
            ),
          ),
          Gaps.hGap2,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'لقد قام الموظف سامر الحموي بشراء الوظيفة رقم 1123',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.fontSizeNormalTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.vGap1,
                Text(
                  'عرض الوظيفة',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.fontSizeSmallTextStyle.copyWith(
                    color: AppColors.darkPrimaryColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
