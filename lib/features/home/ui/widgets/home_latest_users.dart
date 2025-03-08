

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/style/padding_insets.dart';
import '../../../../core/constants/app_textStyle.dart';
import '../../../../core/constants/appcolors.dart';
import '../../../../core/utils/utils.dart';
import '../../../users/ui/widgets/user_widget.dart';

class HomeLatestUsers extends StatelessWidget {
  const HomeLatestUsers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: PaddingInsets.bigPaddingAll,
      margin: PaddingInsets.bigPaddingAll,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: AppColors.boxShadow2,
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'latest_users'.tr(),
                style: AppText.fontSizeNormalTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                  onPressed: (){},
                  child: Text(
                    'show_all'.tr(),
                    style: AppText.fontSizeSmallTextStyle.copyWith(
                      color: AppColors.gold,
                    ),
                  )
              )
            ],
          ),
          SizedBox(
            height: 210,
            child: LayoutBuilder(
              builder: (context, constraints) {
                int itemsPerRow = Utils.calculateRowItemsCount(
                  constraints,
                  216,
                );
                List<Widget> items = List.generate(
                  10,
                      (index) => UserWidget(),
                );

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: (items.length / itemsPerRow).ceil(),
                  itemBuilder: (context, rowIndex) {
                    int startIndex = rowIndex * itemsPerRow;
                    int endIndex = (startIndex + itemsPerRow).clamp(
                      0,
                      items.length,
                    );
                    List<Widget> rowItems = items.sublist(
                      startIndex,
                      endIndex,
                    );

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: rowItems,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}