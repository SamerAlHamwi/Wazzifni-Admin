

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/common/style/gaps.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../core/common/models/company_model.dart';
import '../../../../core/common/style/padding_insets.dart';


class CompanyGallery extends StatelessWidget {
  const CompanyGallery({
    super.key,
    required this.company,
  });

  final Company company;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'company_gallery'.tr(),
          style: AppText.fontSizeNormalTextStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Gaps.vGap2,
        SizedBox(
          width: 100.w,
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: company.attachments?.map((e) => Container(
              width: 200,
              height: 150,
              padding: PaddingInsets.normalPaddingHorizontal,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  e.url!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                      AppAssets.image,
                      fit: BoxFit.cover
                  ), // Fallback
                ),
              ),
            )).toList() ?? [],
          ),
        ),
      ],
    );
  }
}
