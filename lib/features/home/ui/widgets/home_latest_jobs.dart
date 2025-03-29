


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wazzifni_admin/core/boilerplate/pagination/models/get_list_request.dart';
import '../../../../core/boilerplate/pagination/cubits/pagination_cubit.dart';
import '../../../../core/boilerplate/pagination/widgets/pagination_list.dart';
import '../../../../core/common/models/cities_response.dart';
import '../../../../core/common/models/company_model.dart';
import '../../../../core/common/models/enums.dart';
import '../../../../core/common/models/job_model.dart';
import '../../../../core/common/style/padding_insets.dart';
import '../../../../core/constants/app_textStyle.dart';
import '../../../../core/constants/appcolors.dart';
import '../../../../core/utils/utils.dart';
import '../../../jobs/data/repository/job_repository.dart';
import '../../../jobs/data/use_case/get_jobs_use_case.dart';
import '../../../jobs/ui/widgets/job_card.dart';



class HomeLatestJobs extends StatefulWidget {
  const HomeLatestJobs({
    super.key,
  });

  @override
  State<HomeLatestJobs> createState() => _HomeLatestJobsState();
}

class _HomeLatestJobsState extends State<HomeLatestJobs> {
  late PaginationCubit jobsCubit;

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
                  onPressed: (){
                    context.go('/jobs');
                  },
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
            height: 330,
            child: PaginationList<JobModel>(
              paddingTextErrorWidget: 4,
              onCubitCreated: (cubit) => jobsCubit = cubit,
              repositoryCallBack: (model) {
                return GetJobsListUseCase(JobsRepository())
                    .call(
                  params: GetJobsParams(
                    request: GetListRequest(
                      SkipCount: 0,
                      MaxResultCount: 6,
                    ),
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
        ],
      ),
    );
  }
}



