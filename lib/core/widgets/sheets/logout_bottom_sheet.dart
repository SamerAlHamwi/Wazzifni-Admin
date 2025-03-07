


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wazzifni_admin/core/utils/utils.dart';
import '../../common/style/gaps.dart';
import '../../constants/app_textStyle.dart';
import '../../constants/appcolors.dart';
import '../../utils/Navigation/Navigation.dart';
import '../custom_widgets/custom_button.dart';

showLogoutBottomSheet(BuildContext context){
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 4,
              width: 40,
              decoration: BoxDecoration(
                color: AppColors.darkText,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Gaps.vGap4,
            Text(
              'logout'.tr(),
              style: AppText.fontSizeMediumTextStyle.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Gaps.vGap1,
            Text(
              'sure_logout'.tr(),
              style: AppText.fontSizeNormalTextStyle,
            ),
            Gaps.vGap4,
            CustomButton(
              text: 'ok'.tr(),
              onTap: (){
                Utils.logout();
              },
            ),
            Gaps.vGap2,
            CustomButton(
              text: 'cancel'.tr(),
              isSecondaryGradient: true,
              onTap: (){
                Navigation.pop();
              },
            ),
          ],
        ),
      );
    },
  );
}