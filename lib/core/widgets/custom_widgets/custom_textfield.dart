import 'package:flutter/material.dart';
import 'package:wazzifni_admin/core/common/style/padding_insets.dart';

import '../../common/style/gaps.dart';
import '../../constants/app_textStyle.dart';
import '../../constants/appcolors.dart';

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final int maxLines;
  final bool isRequired;
  final bool isEnabled;
  final bool isWithBorder;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.labelText,
    this.suffixIcon,
    this.keyboardType,
    this.maxLines = 1,
    this.isEnabled = true,
    this.isWithBorder = true,
    this.isRequired = false,
    this.onFieldSubmitted,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              children: [
                if (isRequired)
                  const Padding(
                    padding: EdgeInsets.only(right: 4),
                    child: Text(
                      '*',
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  ),
                Text(labelText!, style: AppText.fontSizeNormalTextStyle),
              ],
            ),
          ),
        TextFormField(
          controller: controller,
          onFieldSubmitted: onFieldSubmitted,
          keyboardType: keyboardType,
          enabled: isEnabled,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          maxLines: maxLines,
          style: AppText.fontSizeNormalTextStyle,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            hintText: hintText,
            hintStyle: AppText.fontSizeNormalTextStyle.copyWith(
              color: AppColors.subWhite,
            ),
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: AppColors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: isWithBorder
                  ? const BorderSide(color: AppColors.primaryColor, width: 1.5)
                  : BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: isWithBorder
                  ? const BorderSide(color: AppColors.primaryColor, width: 1.5)
                  : BorderSide.none,
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: isWithBorder
                  ? const BorderSide(color: AppColors.primaryColor, width: 1.5)
                  : BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: isWithBorder
                  ? const BorderSide(color: AppColors.primaryColor, width: 2.0)
                  : BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.red, width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.red, width: 1.5),
            ),
            errorStyle: AppText.fontSizeSmallTextStyle.copyWith(
              color: AppColors.red,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
