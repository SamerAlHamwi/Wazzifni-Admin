
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/common/models/company_model.dart';
import '../../../../core/common/style/gaps.dart';
import '../../../../core/common/style/padding_insets.dart';
import '../../../../core/constants/app_textStyle.dart';
import '../../../../core/constants/appcolors.dart';
import '../../../../core/widgets/image_widgets/custom_image.dart';
import 'about_company_widget.dart';
import 'company_gallery.dart';
import 'company_info_widget.dart';

class CompanyProfile extends StatelessWidget {
  const CompanyProfile({super.key, required this.company});

  final Company company;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: PaddingInsets.extraBigPaddingAll,
        child: SizedBox(
          width: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gaps.vGap2,
              Container(
                width: 200,
                padding: PaddingInsets.bigPaddingAll,
                decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: AppColors.boxShadow
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomImage.circular(
                      radius: 60,
                      isNetworkImage: true,
                      image: company.profile?.url,
                    ),
                    Gaps.vGap1,
                    Text(
                      company.name ?? '',
                      style: AppText.fontSizeLargeTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Gaps.vGap2,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CompanyInfoBox(
                    title: 'number_of_employees'.tr(),
                    subTitle: '${company.numberOfEmployees ?? 0} ${'employee'.tr()}',
                  ),
                  Gaps.hGap2,
                  CompanyInfoBox(
                    title: 'company_location'.tr(),
                    subTitle: company.city?.name ?? '',
                  ),
                  Gaps.hGap2,
                  CompanyInfoBox(
                    title: 'company_establishment_date'.tr(),
                    subTitle: company.dateOfEstablishment!.year.toString(),
                  ),
                ],
              ),
              Gaps.vGap2,
              //Company
              AboutCompany(company: company,),
              Gaps.vGap2,
              //Website
              if(company.webSite != null && company.webSite!.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 100.w,),
                    Text(
                      'company_website2'.tr(),
                      style: AppText.fontSizeMediumTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gaps.vGap1,
                    Text(
                      company.webSite ?? '',
                      style: AppText.fontSizeNormalTextStyle.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              Gaps.vGap2,
              //Spec
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 100.w,),
                  Text(
                    'company_specialization'.tr(),
                    style: AppText.fontSizeMediumTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.vGap1,
                  Text(
                    company.jobType ?? '',
                    style: AppText.fontSizeNormalTextStyle,
                  ),
                ],
              ),
              Gaps.vGap2,
              CompanyGallery(company: company,),
            ],
          ),
        ),
      ),
    );
  }
}