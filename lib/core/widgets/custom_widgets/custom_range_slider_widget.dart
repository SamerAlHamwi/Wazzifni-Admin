

import 'package:flutter/material.dart';

import '../../common/style/padding_insets.dart';
import '../../constants/app_textStyle.dart';
import '../../constants/appcolors.dart';


class CustomRangeSliderWidget extends StatefulWidget {
  const CustomRangeSliderWidget({super.key,
    this.isRequired = false,
    required this.title,
    required this.min,
    required this.max,
    required this.rangeValues,
    required this.onChanged,
  });


  final bool isRequired;
  final String title;
  final double min,max;
  final RangeValues rangeValues;
  final Function(RangeValues) onChanged;


  @override
  State<CustomRangeSliderWidget> createState() => _CustomRangeSliderWidgetState();
}

class _CustomRangeSliderWidgetState extends State<CustomRangeSliderWidget> {



  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        initiallyExpanded: true,
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
        trailing: const Icon(Icons.expand_less, color: Colors.black),
        maintainState: true,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: RangeSlider(
                  values: widget.rangeValues,
                  min: widget.min,
                  max: widget.max,
                  divisions: 40,
                  activeColor: AppColors.primaryColor,
                  inactiveColor: AppColors.subWhite,
                  labels: RangeLabels(
                    '\$${widget.rangeValues.start.toStringAsFixed(0)}',
                    '\$${widget.rangeValues.end.toStringAsFixed(0)}',
                  ),
                  onChanged: (RangeValues values) {
                    widget.onChanged(values);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${widget.rangeValues.start.toStringAsFixed(0)}',
                      style: AppText.fontSizeNormalTextStyle,
                    ),
                    Text(
                        '\$${widget.rangeValues.end.toStringAsFixed(0)}',
                        style: AppText.fontSizeNormalTextStyle
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
