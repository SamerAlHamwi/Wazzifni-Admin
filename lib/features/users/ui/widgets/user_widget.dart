



import 'package:flutter/material.dart';
import 'package:wazzifni_admin/core/common/style/gaps.dart';
import 'package:wazzifni_admin/core/common/style/padding_insets.dart';
import 'package:wazzifni_admin/core/constants/app_assets.dart';
import 'package:wazzifni_admin/core/constants/app_textStyle.dart';
import 'package:wazzifni_admin/core/constants/appcolors.dart';


class UserWidget extends StatelessWidget {
  const UserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      margin: PaddingInsets.normalPaddingHorizontal,
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
          SizedBox(
            width: 125,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'محمد الفواز',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.fontSizeMediumTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'مصمم مواقع ويب',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.fontSizeNormalTextStyle.copyWith(
                    color: AppColors.darkText,
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
