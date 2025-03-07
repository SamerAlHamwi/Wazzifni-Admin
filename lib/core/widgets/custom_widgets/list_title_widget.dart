

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wazzifni_admin/core/common/style/padding_insets.dart';

import '../../constants/app_textStyle.dart';
import '../../constants/appcolors.dart';

class TitleListWidget extends StatelessWidget {
  const TitleListWidget({super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingInsets.bigPaddingHorizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppText.fontSizeLargeTextStyle.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          TextButton(
              onPressed: onTap,
              child: Text(
                'show_all'.tr(),
                style: AppText.fontSizeNormalTextStyle.copyWith(
                    color: AppColors.gold
                ),
              )
          )
        ],
      ),
    );
  }
}
