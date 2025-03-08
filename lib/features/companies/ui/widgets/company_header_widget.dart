

import 'package:flutter/material.dart';
import 'package:wazzifni_admin/core/common/style/gaps.dart';
import 'package:wazzifni_admin/core/constants/app_assets.dart';
import 'package:wazzifni_admin/core/constants/app_textStyle.dart';
import 'package:wazzifni_admin/core/constants/appcolors.dart';

class CompanyHeaderWidget extends StatelessWidget {
  const CompanyHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            // Cover Image
            Container(
              height: 180,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.cover),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Gaps.vGap5,
            // Company Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "شركة البراء",
                    style: AppText.fontSizeMediumTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  Text(
                    "٣٣ موظف، بغداد العراق",
                    style: AppText.fontSizeSmallTextStyle.copyWith(
                      color: AppColors.grey
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "تكنولوجيا البحث، الحوسبة على شبكة الإنترنت، البرمجيات والإعلان عبر الإنترنت",
                    textAlign: TextAlign.center,
                    style: AppText.fontSizeNormalTextStyle.copyWith(
                        color: AppColors.grey
                    ),
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 130,
          left: MediaQuery.of(context).size.width / 2 - 40,
          child: CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 38,
              backgroundImage: AssetImage(AppAssets.companyLogo),
            ),
          ),
        ),
      ],
    );
  }
}
