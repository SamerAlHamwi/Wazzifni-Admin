import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/common/models/job_model.dart';
import '../../../../../core/common/style/gaps.dart';
import '../../../../../core/common/style/padding_insets.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/constants/appcolors.dart';
import '../../../../../core/utils/Navigation/Navigation.dart';
import '../../../../../core/widgets/dialog/custom_dialog.dart';
import '../../../../core/common/models/enums.dart';
import '../../../../core/utils/utils.dart';

class JobCardWidget extends StatefulWidget {
  const JobCardWidget({super.key, this.width, this.jobModel, this.onDelete});

  final double? width;
  final JobModel? jobModel;
  final VoidCallback? onDelete;

  @override
  State<JobCardWidget> createState() => _JobCardWidgetState();
}

class _JobCardWidgetState extends State<JobCardWidget> {
  bool isDeleted = false;

  @override
  Widget build(BuildContext context) {
    return isDeleted
        ? const SizedBox()
        : GestureDetector(
          onTap: () {
            if(widget.jobModel != null){
              context.go('/add-job', extra: widget.jobModel);
            }
          },
          child: Container(
            width: widget.width ?? 270,
            padding: const EdgeInsets.all(1),
            margin: PaddingInsets.normalPaddingAll,
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              boxShadow: AppColors.boxShadow,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              padding: PaddingInsets.cardPaddingHV,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Text(
                          widget.jobModel!.title ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppText.fontSizeMediumTextStyle.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      PopupMenuButton<String>(
                        onSelected: (value) async {
                          if (value == 'edit') {
                            // Navigation.push(
                            //     AddJobScreen(
                            //       jobModel: widget.jobModel,
                            //     )
                            // );
                          } else if (value == 'delete') {
                            await showCustomDialog(
                              context: context,
                              text: 'sure_delete_post'.tr(),
                              onTapOK: () async {
                                // await DeleteJobUseCase(AddJobsRepository())
                                //     .call(params: DeleteJobParams(id: widget.jobModel!.id!),).then((value){
                                //   setState(() {
                                //     isDeleted = true;
                                //   });
                                // });
                                Navigation.pop();
                              },
                              onTapCancel: () {
                                Navigation.pop();
                              },
                              isWithCancel: true,
                            );
                          }
                        },
                        itemBuilder: (BuildContext context) {
                          return [
                            PopupMenuItem(
                              value: 'edit',
                              child: Text(
                                'edit_job'.tr(),
                                style: AppText.fontSizeNormalTextStyle,
                              ),
                            ),
                            PopupMenuItem(
                              value: 'delete',
                              child: Text(
                                'delete_job'.tr(),
                                style: AppText.fontSizeNormalTextStyle,
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'monthly'.tr(),
                        style: AppText.fontSizeMediumTextStyle,
                      ),
                      Gaps.hGap1,
                      Text(
                        '${widget.jobModel!.minSalary!.toInt().toString()}\$ - ${widget.jobModel!.maxSalary!.toInt().toString()}\$',
                        style: AppText.fontSizeMediumTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.jobModel!.company!.city!.name!,
                        style: AppText.fontSizeSmallTextStyle,
                      ),
                      Text(
                        Utils.getTimeAgo(widget.jobModel!.creationTime!),
                        style: AppText.fontSizeSmallTextStyle,
                      ),
                    ],
                  ),
                  Gaps.vGap1,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: getAttributeWidth(),
                        padding: PaddingInsets.cardPaddingHV,
                        decoration: BoxDecoration(
                          color: AppColors.card1,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            WorkLevel.values
                                .where(
                                  (element) =>
                                      element.value ==
                                      widget.jobModel!.workLevel,
                                )
                                .first
                                .name
                                .tr(),
                            style: AppText.fontSizeSmallTextStyle,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Container(
                        width: getAttributeWidth(),
                        padding: PaddingInsets.cardPaddingHV,
                        decoration: BoxDecoration(
                          color: AppColors.card2,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            WorkEngagement.values
                                .where(
                                  (element) =>
                                      element.value ==
                                      widget.jobModel!.workEngagement,
                                )
                                .first
                                .name
                                .tr(),
                            style: AppText.fontSizeSmallTextStyle,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Container(
                        width: getAttributeWidth(),
                        padding: PaddingInsets.cardPaddingHV,
                        decoration: BoxDecoration(
                          color: AppColors.card3,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            EducationLevel.values
                                .where(
                                  (e) =>
                                      e.value ==
                                      widget.jobModel!.educationLevel,
                                )
                                .first
                                .name
                                .tr(),
                            style: AppText.fontSizeSmallTextStyle,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
  }

  double getAttributeWidth() {
    if (widget.width != null) {
      return (widget.width! / 4);
    } else {
      return 75;
    }
  }
}
