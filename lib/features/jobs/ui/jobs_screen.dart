


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wazzifni_admin/core/common/style/gaps.dart';
import 'package:wazzifni_admin/core/common/style/padding_insets.dart';
import 'package:wazzifni_admin/core/constants/appcolors.dart';
import 'package:wazzifni_admin/core/utils/utils.dart';
import 'package:wazzifni_admin/core/widgets/custom_widgets/custom_dropdown.dart';
import 'package:wazzifni_admin/features/home/ui/root_page.dart';
import 'package:wazzifni_admin/features/jobs/ui/widgets/job_card.dart';
import '../../../core/boilerplate/pagination/cubits/pagination_cubit.dart';
import '../../../core/boilerplate/pagination/models/get_list_request.dart';
import '../../../core/boilerplate/pagination/widgets/pagination_list.dart';
import '../../../core/common/models/dropdown_model.dart';
import '../../../core/common/models/enums.dart';
import '../../../core/common/models/job_model.dart';
import '../../../core/constants/app_textStyle.dart';
import '../../../core/utils/storage/storage.dart';
import '../../../core/widgets/custom_widgets/custom_textfield.dart';
import '../data/repository/job_repository.dart';
import '../data/use_case/get_jobs_use_case.dart';


class JobsScreen extends StatefulWidget {
  const JobsScreen({super.key});

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  TextEditingController controller = TextEditingController();
  late PaginationCubit jobsCubit;
  int cityId = -1;
  int status = -1;
  GetJobsParams params = GetJobsParams(
    isIApply: false,
    request: GetListRequest(),
  );

  ScrollController scrollController = ScrollController();

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
                    items: SharedStorage.getCities()!.items!
                        .map((e) => DropDownItem(id: e.id!, name: e.name ?? ''))
                        .toList(),
                    onChanged: (value) {
                      cityId = int.tryParse(value) ?? -1;
                      jobsCubit.getList();
                    },
                  ),
                ),
                Gaps.hGap1,
                SizedBox(
                  width: 150,
                  child: CustomDropdown(
                    labelText: "status".tr(),
                    items: StatusEnum.values.map((e)=> DropDownItem(id: e.value, name: e.name.tr())).toList(),
                    onChanged: (value) {
                      status = int.tryParse(value) ?? -1;
                      jobsCubit.getList();
                    },
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
                    keyboardType: TextInputType.text,
                    hintText: 'search_hint'.tr(),
                    onFieldSubmitted: (value){
                      jobsCubit.getList();
                    },
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
              child: PaginationList<JobModel>(
                paddingTextErrorWidget: 4,
                onCubitCreated: (cubit) => jobsCubit = cubit,
                repositoryCallBack: (model) {
                  return GetJobsListUseCase(JobsRepository())
                      .call(
                    params: params.copyWith(
                      request: model,
                      cityId: cityId,
                      status: status,
                      keyword: controller.text.trim(),
                    ),
                  );
                },
                listBuilder: (list) {
                  return
                    LayoutBuilder(
                      builder: (context, constraints) {
                        int itemsPerRow = Utils.calculateRowItemsCount(constraints, 290);
                        List<Widget> items = List.generate(list.length, (index) => JobCardWidget(
                          jobModel: list[index]
                        ));
                        return CustomScrollView(
                          controller: scrollController,
                          slivers: [
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                    (context, rowIndex) {
                                  int startIndex = rowIndex * itemsPerRow;
                                  int endIndex = (startIndex + itemsPerRow).clamp(0, items.length);
                                  List<Widget> rowItems = items.sublist(startIndex, endIndex);

                                  return Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: rowItems,
                                    ),
                                  );
                                },
                                childCount: (items.length / itemsPerRow).ceil(),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                },
                withPagination: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}




