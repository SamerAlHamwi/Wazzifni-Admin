


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

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
          const SizedBox(height: 20),
          Center(child: Image.asset(AppAssets.logo, height: 60)),
          const SizedBox(height: 20),
          _buildSidebarItem(Icons.dashboard, "dashboard".tr()),
          _buildSidebarItem(Icons.work, "jobs".tr()),
          _buildSidebarItem(Icons.person, "users".tr()),
          _buildSidebarItem(Icons.business, "companies".tr()),
          _buildSidebarItem(Icons.settings, "settings".tr()),
        ],
      ),
    );
  }

  Widget _buildSidebarItem(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: Colors.black54),
          const SizedBox(width: 10),
          Text(label, style: AppText.fontSizeMediumTextStyle),
        ],
      ),
    );
  }
}
