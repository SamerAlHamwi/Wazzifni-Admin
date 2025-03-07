





import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:wazzifni_admin/core/utils/utils.dart';
import '../../common/style/gaps.dart';
import '../../constants/app_textStyle.dart';
import '../../constants/appcolors.dart';
import '../../utils/Navigation/Navigation.dart';
import '../custom_widgets/custom_button.dart';

void showChangeLanguageBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 4,
                  width: 40,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Gaps.vGap4,
                Text(
                  'change_language'.tr(),
                  style: AppText.fontSizeMediumTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.vGap1,
                Text(
                  'select_language'.tr(),
                  style: AppText.fontSizeNormalTextStyle,
                ),
                Gaps.vGap4,
                CustomButton(
                  text: 'arabic'.tr(),
                  onTap: () async {
                    await context.setLocale(const Locale('ar'));
                    Navigation.pop();
                    setState(() {});
                    Phoenix.rebirth(context);
                  },
                ),
                Gaps.vGap2,
                CustomButton(
                  text: 'english'.tr(),
                  isSecondaryGradient: true,
                  onTap: () async {
                    await context.setLocale(const Locale('en'));
                    Navigation.pop();
                    setState(() {});
                    Phoenix.rebirth(context);
                  },
                ),
                Gaps.vGap2,
              ],
            ),
          );
        },
      );
    },
  );
}

