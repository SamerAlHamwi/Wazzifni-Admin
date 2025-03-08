


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wazzifni_admin/core/common/style/gaps.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_textStyle.dart';
import '../../../../core/constants/appcolors.dart';


class AdminSidebar extends StatelessWidget {
  const AdminSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        boxShadow: AppColors.boxShadow,
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gaps.vGap4,
          Center(child: Image.asset(AppAssets.logo, height: 60)),
          Gaps.vGap4,
          _buildSidebarItem(AppAssets.dashboard, "dashboard".tr()),
          _buildSidebarItem(AppAssets.job, "jobs".tr()),
          _buildSidebarItem(AppAssets.myRequests, "job_applications".tr()),
          _buildSidebarItem(AppAssets.users, "users".tr()),
          _buildSidebarItem(AppAssets.companies, "companies".tr()),
        ],
      ),
    );
  }

  Widget _buildSidebarItem(String icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Image.asset(icon,width: 28,height: 28,),
          Gaps.hGap2,
          Text(label, style: AppText.fontSizeMediumTextStyle),
        ],
      ),
    );
  }
}
