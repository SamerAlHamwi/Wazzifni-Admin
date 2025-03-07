

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wazzifni_admin/core/common/style/padding_insets.dart';

import '../../constants/app_textStyle.dart';
import '../../constants/appcolors.dart';

class CustomWrapExpansionTile extends StatefulWidget {
  CustomWrapExpansionTile(
      {super.key,
        required this.items,
        required this.title,
        this.isRequired = false,
        this.isExpanded = false,
        this.selectedOption,
        required this.onChanged,
      });

  final List<String> items;
  final String title;
  String? selectedOption;
  final bool isRequired;
  final bool isExpanded;
  final Function(String) onChanged;

  @override
  State<CustomWrapExpansionTile> createState() => _CustomWrapExpansionTileState();
}

class _CustomWrapExpansionTileState extends State<CustomWrapExpansionTile> {


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
              initiallyExpanded: widget.isExpanded,
              maintainState: true,
              textColor: AppColors.black,
              collapsedTextColor: AppColors.black,
              iconColor: AppColors.black,
              collapsedIconColor: AppColors.black,
              childrenPadding: PaddingInsets.normalPaddingHorizontal,
              title: Row(
                children: [
                  if(widget.isRequired)
                    Padding(
                      padding: PaddingInsets.lowPaddingHorizontal,
                      child: Text(
                        '*',
                        style: AppText.fontSizeLargeTextStyle.copyWith(
                          color: AppColors.gold,
                        ),
                      ),
                    ),
                  Text(
                    widget.title,
                    style: AppText.fontSizeMediumTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              children: [
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: widget.items.map((option) {
                    bool isSelected = widget.selectedOption != null ? widget.selectedOption == option : false;
                    return GestureDetector(
                      onTap: () {
                        widget.onChanged(option);
                        setState(() {});
                      },
                      child: Container(
                        padding: PaddingInsets.cardPaddingHV,
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.primaryColor : AppColors.subWhite,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          option.tr(),
                          style: AppText.fontSizeNormalTextStyle.copyWith(
                            color: isSelected ? AppColors.white : AppColors.black,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
          ),
        ),
        const Divider(thickness: 1.5,),
      ],
    );
  }
}

