

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wazzifni_admin/core/constants/app_textStyle.dart';

import '../../constants/appcolors.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({super.key,
    this.height,
    this.width,
    this.buttonColor,
    this.isSecondaryGradient = false,
    this.isWithGradient = true,
    required this.text,
    required this.onTap,
  });

  final double? height,width;
  final String text;
  final VoidCallback onTap;
  final bool isSecondaryGradient;
  final bool isWithGradient;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? 70.w,
        height: height ?? 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: buttonColor,
          gradient: isWithGradient ? (isSecondaryGradient ? AppColors.secondaryGradient : AppColors.primaryGradient) : null,
          boxShadow: AppColors.boxShadow,
        ),
        child: Center(
          child: Text(
            text,
            style: AppText.fontSizeNormalTextStyle.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
