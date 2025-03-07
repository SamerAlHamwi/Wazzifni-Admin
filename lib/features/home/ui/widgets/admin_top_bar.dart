



import 'package:flutter/material.dart';
import 'package:wazzifni_admin/core/common/style/padding_insets.dart';
import 'package:wazzifni_admin/core/constants/appcolors.dart';
import '../../../../core/constants/app_assets.dart';



class AdminTopBar extends StatelessWidget {
  final bool isSmallScreen;
  const AdminTopBar({super.key, required this.isSmallScreen});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: PaddingInsets.cardPaddingHV,
      decoration: BoxDecoration(
        boxShadow: AppColors.boxShadow2,
        color: AppColors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (isSmallScreen)
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          // if (isSmallScreen)
          Image.asset(AppAssets.logo, height: 30),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.primaryColor.withOpacity(0.5),
                width: 2,
              )
            ),
            child: IconButton(
                onPressed: (){},
                icon: Icon(
                  Icons.notifications_active_outlined,
                  color: AppColors.black.withOpacity(0.5),
                )
            ),
          )
        ],
      ),
    );
  }
}


