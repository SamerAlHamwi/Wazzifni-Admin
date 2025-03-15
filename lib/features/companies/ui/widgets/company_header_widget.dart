

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wazzifni_admin/core/common/style/gaps.dart';
import 'package:wazzifni_admin/core/common/style/padding_insets.dart';
import 'package:wazzifni_admin/core/constants/app_assets.dart';
import 'package:wazzifni_admin/core/constants/app_textStyle.dart';
import 'package:wazzifni_admin/core/constants/appcolors.dart';

import '../../../../core/widgets/custom_widgets/custom_button.dart';

class CompanyHeaderWidget extends StatefulWidget {
  const CompanyHeaderWidget({super.key});

  @override
  State<CompanyHeaderWidget> createState() => _CompanyHeaderWidgetState();
}

class _CompanyHeaderWidgetState extends State<CompanyHeaderWidget> {

  int _selectedIndex = 0;
  final List<String> _labels = ["jobs".tr(), "job_applications".tr(),"account_info".tr(),];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            // Cover Image
            Stack(
              children: [
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppAssets.cover),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 10,
                  child: CustomButton(
                    width: 120,
                    height: 35,
                    isSecondaryGradient: true,
                    text: 'approved'.tr(),
                    onTap: () {

                    },
                  ),
                ),
              ],
            ),
            Gaps.vGap5,
          ],
        ),
        Positioned(
          top: 130,
          left: 0,
          right: 0,
          child: Container(
            height: 82,
            width: double.infinity,
            padding: PaddingInsets.bigPaddingAll,
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: AppColors.boxShadow2,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage(AppAssets.companyLogo),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                "شركة البراء",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppText.fontSizeMediumTextStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                )
                            ),
                            Text(
                              "بغداد/العراق",
                              style: AppText.fontSizeSmallTextStyle.copyWith(
                                  color: AppColors.grey
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                  child: ToggleButtons(
                    borderRadius: BorderRadius.circular(10),
                    selectedBorderColor: AppColors.darkPrimaryColor,
                    selectedColor: Colors.white,
                    fillColor: AppColors.primaryColor,
                    color: Colors.black,
                    isSelected: List.generate(3, (index) => index == _selectedIndex),
                    onPressed: (int index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    children: _labels.map((label) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(label),
                    )).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
