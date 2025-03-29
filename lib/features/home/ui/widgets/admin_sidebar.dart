


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wazzifni_admin/core/common/style/gaps.dart';
import 'package:go_router/go_router.dart';
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
          _buildSidebarItem(0, AppAssets.dashboard, "dashboard".tr(),context),
          _buildSidebarItem(1, AppAssets.job, "jobs".tr(),context),
          _buildSidebarItem(2, AppAssets.myRequests, "job_applications".tr(),context),
          _buildSidebarItem(3, AppAssets.users, "users".tr(),context),
          _buildSidebarItem(4, AppAssets.companies, "companies".tr(),context),
          _buildSidebarItem(5, AppAssets.roles, "roles".tr(),context),
        ],
      ),
    );
  }

  Widget _buildSidebarItem(int type, String icon, String label,BuildContext context) {
    return GestureDetector(
      onTap: (){
        switch(type){
          case 0:
            context.go('/home');
            break;
          case 1:
            context.go('/jobs');
            break;
          case 2:
            context.go('/job-applications');
            break;
          case 3:
            context.go('/users');
            break;
          case 4:
            context.go('/companies');
            break;
          case 5:
            context.go('/roles');
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            Image.asset(icon,width: 28,height: 28,),
            Gaps.hGap2,
            Text(label, style: AppText.fontSizeMediumTextStyle),
          ],
        ),
      ),
    );
  }
}
