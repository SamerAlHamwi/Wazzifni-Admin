



import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../core/common/style/gaps.dart';
import '../../../../../../core/common/style/padding_insets.dart';
import '../../../../../../core/constants/app_textStyle.dart';
import '../../../../../../core/constants/appcolors.dart';
import '../../../../core/constants/app_assets.dart';



class AccountInfoWidget extends StatelessWidget {
  const AccountInfoWidget({
    super.key,
    required this.title,
    required this.iconPath,
    required this.onTap,
    this.isWithAdd = false,
    this.isWithEdit = true,
    required this.body
  });

  final String title,iconPath;
  final VoidCallback onTap;
  final bool isWithAdd;
  final bool isWithEdit;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: PaddingInsets.profileCardPaddingHV,
        margin: PaddingInsets.lowPaddingVertical,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: AppColors.boxShadow,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset(
                        iconPath,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Gaps.hGap2,
                    Text(
                      title,
                      style: AppText.fontSizeNormalTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    if(isWithEdit)
                    SvgPicture.asset(
                      AppAssets.editSvg,
                      color: AppColors.gold,
                    ),
                    if(isWithAdd)
                      Gaps.hGap2,
                    if(isWithAdd)
                    Container(
                      height: 26,
                      width: 26,
                      decoration: const BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 16,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Gaps.vGap1,
            const Padding(
              padding: PaddingInsets.bigPaddingHorizontal,
              child: Divider(),
            ),
            Gaps.vGap1,
            Padding(
              padding: PaddingInsets.normalPaddingHorizontal,
              child: body,
            ),
          ],
        ),
      ),
    );
  }
}
