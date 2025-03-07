
import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_textStyle.dart';
import '../../../../../../core/constants/appcolors.dart';

class LanguagesListWidget extends StatelessWidget {
  const LanguagesListWidget({super.key,required this.languages});

  final List<String> languages;


  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.start,
      children: languages
          .map(
            (skill) => Chip(
              label: Text(
                skill,
                style: AppText.fontSizeNormalTextStyle.copyWith(
                  color: AppColors.black,
                ),
              ),
              backgroundColor: Colors.grey[200],
              deleteIcon: const SizedBox(),
            ),
      )
          .toList(),
    );
  }
}
