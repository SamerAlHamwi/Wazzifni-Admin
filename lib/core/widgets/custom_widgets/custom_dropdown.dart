

import 'package:flutter/material.dart';
import 'package:wazzifni_admin/core/constants/appcolors.dart';

import '../../common/models/dropdown_model.dart';
import '../../common/style/gaps.dart';
import '../../constants/app_textStyle.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    super.key,
    this.labelText,
    this.selectedItem,
    required this.items,
    required this.onChanged,
  });

  final String? labelText;
  final List<DropDownItem> items;
  final ValueChanged<String> onChanged;
  final String? selectedItem;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _selectedItem;

  @override
  void initState() {
    super.initState();
    if(widget.selectedItem != null){
      _selectedItem = widget.selectedItem;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.labelText!,
                style: AppText.fontSizeNormalTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.vGap1,
            ],
          ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              colors: [Colors.purple, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: AppColors.boxShadow,
          ),
          padding: const EdgeInsets.all(1),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                value: _selectedItem,
                items: widget.items.map((DropDownItem item) {
                  return DropdownMenuItem<String>(
                    value: item.id.toString(),
                    child: Text(
                      item.name,
                      textAlign: TextAlign.end,
                      style: AppText.fontSizeNormalTextStyle,
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                  if (newValue != null) {
                    widget.onChanged(newValue);
                  }
                },
                icon: const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

