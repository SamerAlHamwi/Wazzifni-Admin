



import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wazzifni_admin/core/common/style/gaps.dart';
import 'package:wazzifni_admin/core/common/style/padding_insets.dart';
import 'package:wazzifni_admin/core/constants/appcolors.dart';
import 'package:wazzifni_admin/core/utils/utils.dart';
import 'package:wazzifni_admin/core/widgets/custom_widgets/custom_dropdown.dart';
import 'package:wazzifni_admin/features/jobs/ui/widgets/job_card.dart';
import 'package:wazzifni_admin/features/users/ui/widgets/user_widget.dart';
import '../../../core/common/models/cities_response.dart';
import '../../../core/common/models/company_model.dart';
import '../../../core/common/models/dropdown_model.dart';
import '../../../core/common/models/enums.dart';
import '../../../core/common/models/job_model.dart';
import '../../../core/constants/app_textStyle.dart';
import '../../../core/widgets/custom_widgets/custom_textfield.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen({super.key});

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 65,
          padding: PaddingInsets.cardPaddingHV,
          decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: AppColors.boxShadow2,
          ),
          child: Row(
            children: [
              SizedBox(
                width: 150,
                child: CustomDropdown(
                  labelText: "city".tr(),
                  items: [
                    DropDownItem(id: 0, name: 'بغداد'),
                    DropDownItem(id: 1, name: 'النجف'),
                    DropDownItem(id: 2, name: 'اربيل'),
                  ],
                  onChanged: (value) {},
                ),
              ),
              Gaps.hGap1,
              SizedBox(
                width: 150,
                child: CustomDropdown(
                  labelText: "status".tr(),
                  items: [
                    DropDownItem(id: 0, name: 'pending'.tr()),
                    DropDownItem(id: 1, name: 'approved'.tr()),
                    DropDownItem(id: 2, name: 'rejected'.tr()),
                  ],
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: PaddingInsets.bigPaddingAll,
          child: Row(
            children: [
              Container(
                height: 48,
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                  boxShadow: AppColors.boxShadow2,
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Container(
                  padding: PaddingInsets.bigPaddingHV,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'jobs'.tr(),
                      style: AppText.fontSizeNormalTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Gaps.hGap1,
              Expanded(
                child: CustomTextField(
                  controller: controller,
                  keyboardType: TextInputType.phone,
                  hintText: 'search_hint'.tr(),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: PaddingInsets.bigPaddingAll,
            margin: PaddingInsets.bigPaddingAll,
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: AppColors.boxShadow2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                int itemsPerRow = Utils.calculateRowItemsCount(constraints, 280);
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
                  width: 270,
                ));

                return ListView.builder(
                  itemCount: (items.length / itemsPerRow).ceil(),
                  itemBuilder: (context, rowIndex) {
                    int startIndex = rowIndex * itemsPerRow;
                    int endIndex = (startIndex + itemsPerRow).clamp(
                      0,
                      items.length,
                    );
                    List<Widget> rowItems = items.sublist(startIndex, endIndex);

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
        ),
      ],
    );
  }
}




