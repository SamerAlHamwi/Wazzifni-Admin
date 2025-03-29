


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/common/models/job_application_model.dart';
import '../../../../../core/common/style/gaps.dart';
import '../../../../../core/common/style/padding_insets.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/constants/appcolors.dart';
import '../../../../core/common/models/enums.dart';
import '../../../../core/utils/utils.dart';
import '../../../publish_job/data/use_case/delete_work_post_use_case.dart';
import '../../data/repository/job_application_repository.dart';
import '../../data/use_case/delete_application_use_case.dart';


class UserApplyCard extends StatelessWidget {
  const UserApplyCard({
    super.key,
    required this.jobApplicationModel,
    required this.onDelete,
  });

  final JobApplicationModel jobApplicationModel;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go('/user-details',extra: jobApplicationModel.profile?.id);
      },
      child: Container(
        width: 250,
        padding: PaddingInsets.cardPaddingHV,
        margin: PaddingInsets.normalPaddingAll,
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: AppColors.boxShadow,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: AppColors.primaryColor,
                      backgroundImage: NetworkImage(
                          jobApplicationModel.profile?.image?.url ?? ''
                      ),
                    ),
                    Gaps.hGap1,
                    SizedBox(
                      width: 120,
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            jobApplicationModel.profile?.user?.registrationFullName ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppText
                                .fontSizeNormalTextStyle
                                .copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Gaps.vGap1,
                          Text(
                            jobApplicationModel.workPost?.title ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppText
                                .fontSizeNormalTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                PopupMenuButton<String>(
                  onSelected: (value) async {
                    // if (value == 'edit') {
                    //   // Implement edit action
                    // } else
                    if (value == 'delete') {
                      await DeleteApplicationUseCase(JobApplicationRepository())
                          .call(params: DeleteJobParams(id: jobApplicationModel.id!),).then((value){
                        onDelete();
                      });
                    }
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      // PopupMenuItem(
                      //   value: 'edit',
                      //   child: Text(
                      //     'approve_employee'.tr(),
                      //     style: AppText
                      //         .fontSizeNormalTextStyle,
                      //   ),
                      // ),
                      PopupMenuItem(
                        value: 'delete',
                        child: Text(
                          'delete'.tr(),
                          style: AppText
                              .fontSizeNormalTextStyle,
                        ),
                      ),
                    ];
                  },
                  icon: const Icon(
                    Icons.more_vert,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
            Gaps.vGap2,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 6
                  ),
                  decoration: BoxDecoration(
                    color: Utils.getStatusColor(StatusEnum.values.firstWhere((e) => jobApplicationModel.status == e.value),),
                    borderRadius: BorderRadius.circular(4)
                  ),
                  child: Text(
                    Utils.getPostStatus(jobApplicationModel.status!),
                    style: AppText.fontSizeSmallTextStyle.copyWith(
                      color: AppColors.white
                    ),
                  ),
                ),
                Text(
                  '#${jobApplicationModel.workPost!.slug}',
                  style: AppText.fontSizeSmallTextStyle
                      .copyWith(
                    color: AppColors.gold,
                  ),
                ),
                Text(
                  Utils.getTimeAgo(jobApplicationModel.creationTime!),
                  style: AppText.fontSizeSmallTextStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}
