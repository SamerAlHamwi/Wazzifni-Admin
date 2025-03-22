


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wazzifni_admin/core/common/models/company_model.dart';

import '../../../../core/common/style/gaps.dart';
import '../../../../core/common/style/padding_insets.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_textStyle.dart';
import '../../../../core/constants/appcolors.dart';
import '../../../../core/widgets/image_widgets/custom_image.dart';


class CompanyCard extends StatelessWidget {
  const CompanyCard({super.key, required this.company});

  final Company company;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.go('/company-details/${company.id}');
      },
      child: Container(
        width: 150,
        height: 155,
        padding: PaddingInsets.bigPaddingAll,
        margin: PaddingInsets.lowPaddingHorizontal,
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: AppColors.boxShadow2,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            CustomImage.circular(
              radius: 50,
              isNetworkImage: true,
              image: company.profile?.url,
            ),
            Spacer(),
            Text(
              company.name ?? '',
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: AppText.fontSizeMediumTextStyle.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Gaps.vGap1,
            Text(company.city?.name ?? '', style: AppText.fontSizeNormalTextStyle),
          ],
        ),
      ),
    );
  }
}