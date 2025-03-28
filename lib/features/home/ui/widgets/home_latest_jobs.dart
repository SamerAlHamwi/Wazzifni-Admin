


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/common/models/cities_response.dart';
import '../../../../core/common/models/company_model.dart';
import '../../../../core/common/models/enums.dart';
import '../../../../core/common/models/job_model.dart';
import '../../../../core/common/style/padding_insets.dart';
import '../../../../core/constants/app_textStyle.dart';
import '../../../../core/constants/appcolors.dart';
import '../../../../core/utils/utils.dart';
import '../../../jobs/ui/widgets/job_card.dart';



class HomeLatestJobs extends StatelessWidget {
  const HomeLatestJobs({
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
                'latest_jobs'.tr(),
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
            height: 360,
            child: LayoutBuilder(
              builder: (context, constraints) {
                int itemsPerRow = Utils.calculateRowItemsCount(
                  constraints,
                  290,
                );
                List<Widget> items = List.generate(20, (index) => JobCardWidget(
                  jobModel: JobModel(
                    title: 'مبرمج تطبيقات موبايل',
                    minSalary: 1000,
                    maxSalary: 1000,
                    company: Company(
                      city: CityModel(
                          name: 'بغداد'
                      ),
                    ),
                    creationTime: DateTime.now(),
                    workLevel: WorkLevel.manager.value,
                    workEngagement: WorkEngagement.full_time.value,
                    educationLevel: EducationLevel.high_school.value,
                  ),
                ));

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



