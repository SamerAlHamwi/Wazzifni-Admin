


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wazzifni_admin/core/common/style/gaps.dart';
import 'package:wazzifni_admin/core/common/style/padding_insets.dart';
import 'package:wazzifni_admin/core/constants/appcolors.dart';
import 'package:wazzifni_admin/core/utils/utils.dart';
import 'package:wazzifni_admin/core/widgets/custom_widgets/custom_dropdown.dart';
import 'package:wazzifni_admin/features/home/ui/root_page.dart';
import 'package:wazzifni_admin/features/job_applications/ui/widgets/user_apply_card.dart';
import '../../../core/boilerplate/pagination/cubits/pagination_cubit.dart';
import '../../../core/boilerplate/pagination/widgets/pagination_list.dart';
import '../../../core/common/models/dropdown_model.dart';
import '../../../core/common/models/job_application_model.dart';
import '../../../core/constants/app_textStyle.dart';
import '../../../core/widgets/custom_widgets/custom_textfield.dart';
import '../data/repository/job_application_repository.dart';
import '../data/use_case/get_applications_job_use_case.dart';



class JobApplicationsScreen extends StatefulWidget {
  const JobApplicationsScreen({super.key});

  @override
  State<JobApplicationsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobApplicationsScreen> {
  TextEditingController controller = TextEditingController();
  late PaginationCubit jobsCubit;

  @override
  Widget build(BuildContext context) {
    return AdminHomePage(
      child: Column(
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
                        'job_applications'.tr(),
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
              child: PaginationList<JobApplicationModel>(
                paddingTextErrorWidget: 4,
                onCubitCreated: (cubit) => jobsCubit = cubit,
                repositoryCallBack: (model) {
                  return GetApplicationJobsListUseCase(JobApplicationRepository())
                      .call(
                    params: GetApplicationJobsParams(
                      request: model,
                    ),
                  );
                },
                listBuilder: (list) {
                  return
                    LayoutBuilder(
                      builder: (context, constraints) {
                        int itemsPerRow = Utils.calculateRowItemsCount(constraints, 275);
                        List<Widget> items = List.generate(list.length, (index) => UserApplyCard(
                            jobApplicationModel: list[index],
                            onDelete: (){},
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
                    );
                },
                withPagination: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}




