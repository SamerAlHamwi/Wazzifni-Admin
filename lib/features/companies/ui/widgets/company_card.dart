


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/style/gaps.dart';
import '../../../../core/common/style/padding_insets.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_textStyle.dart';
import '../../../../core/constants/appcolors.dart';


class CompanyCard extends StatelessWidget {
  const CompanyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.go('/company-details/5');
      },
      child: Container(
        width: 150,
        height: 155,
        padding: PaddingInsets.bigPaddingAll,
        margin: PaddingInsets.lowPaddingHorizontal,
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: AppColors.boxShadow2,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Image.asset(AppAssets.logo, width: 50, height: 50),
            Spacer(),
            Text(
              'شركة المستقبل',
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: AppText.fontSizeMediumTextStyle.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Gaps.vGap1,
            Text('بغداد', style: AppText.fontSizeNormalTextStyle),
          ],
        ),
      ),
    );
  }
}