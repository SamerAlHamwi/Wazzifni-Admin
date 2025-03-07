

import 'package:flutter/material.dart';
import 'package:wazzifni_admin/core/constants/app_assets.dart';
import 'package:wazzifni_admin/core/constants/appcolors.dart';

class ProfileBackgroundPage extends StatelessWidget {
  final Widget body;

  const ProfileBackgroundPage({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: IgnorePointer(
                child: Image.asset(
                  AppAssets.background2,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            // Body content
            Positioned.fill(
                child: body
            ),
          ],
        ),
      ),
    );
  }
}
