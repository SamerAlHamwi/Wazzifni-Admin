
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/boilerplate/pagination/cubits/pagination_cubit.dart';
import '../../../../core/boilerplate/pagination/widgets/pagination_list.dart';
import '../../../../core/common/models/job_model.dart';
import '../../../../core/common/style/gaps.dart';
import '../../../../core/common/style/padding_insets.dart';
import '../../../../core/constants/app_textStyle.dart';
import '../../../../core/constants/appcolors.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/custom_widgets/custom_textfield.dart';
import '../../../jobs/data/repository/job_repository.dart';
import '../../../jobs/data/use_case/get_jobs_use_case.dart';
import '../../../jobs/ui/widgets/job_card.dart';

class CompanyJobsWidget extends StatefulWidget {
  const CompanyJobsWidget({super.key,required this.companyId});

  final int companyId;

  @override
  State<CompanyJobsWidget> createState() => _CompanyJobsWidgetState();
}

class _CompanyJobsWidgetState extends State<CompanyJobsWidget> {

  TextEditingController controller = TextEditingController();
  late PaginationCubit jobsCubit;
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
            margin: PaddingInsets.normalPaddingAll,
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: AppColors.boxShadow2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: PaginationList<JobModel>(
              paddingTextErrorWidget: 4,
              onCubitCreated: (cubit) => jobsCubit = cubit,
              repositoryCallBack: (model) {
                return GetJobsListUseCase(JobsRepository()).call(
                  params: GetJobsParams(
                    request: model,
                    companyId: widget.companyId,
                    keyword: controller.text.trim(),
                  ),
                );
              },
              listBuilder: (list) {
                return LayoutBuilder(
                  builder: (context, constraints) {
                    int itemsPerRow = Utils.calculateRowItemsCount(
                      constraints,
                      290,
                    );
                    List<Widget> items = List.generate(
                      list.length,
                      (index) => JobCardWidget(jobModel: list[index],),
                    );

                    return CustomScrollView(
                      controller: scrollController,
                      slivers: [
                        SliverList(
                          delegate: SliverChildBuilderDelegate((context, rowIndex) {
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
    );
  }
}
