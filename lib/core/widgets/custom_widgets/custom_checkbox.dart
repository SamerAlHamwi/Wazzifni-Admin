

import 'package:flutter/material.dart';
import 'package:wazzifni_admin/core/constants/appcolors.dart';

import '../../common/style/gaps.dart';
import '../../constants/app_textStyle.dart';



class RowCheckBox extends StatelessWidget {
  const RowCheckBox({super.key, required this.title, required this.onChanged, required this.value});

  final String title;
  final bool value;
  final Function(bool value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          value: value,
          onChanged: onChanged,
        ),
        Gaps.hGap2,
        Text(
          title,
          style: AppText.fontSizeNormalTextStyle,
        ),
      ],
    );
  }
}



class CustomCheckBox extends StatefulWidget {
  CustomCheckBox({super.key, required this.onChanged,this.value});

  Function(bool value) onChanged;
  bool? value;

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    initData();
  }

  initData(){
    setState(() {
      isChecked = widget.value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
        widget.onChanged(isChecked);
      },
      child: Container(
        width: 22,
        height: 22,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(4),
          gradient: const LinearGradient(
            colors: [Colors.purple, Colors.blue],
          ),
        ),
        child: Center(
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: isChecked ? AppColors.primaryColor.withOpacity(0.5) : Colors.white,
              borderRadius: BorderRadius.circular(3),
            ),
            child: isChecked ?  const Center(
              child: Icon(
                Icons.check,
                size: 14,
                color: AppColors.white,
              ),
            ) : const SizedBox()
          ),
        ),
      ),
    );
  }
}
