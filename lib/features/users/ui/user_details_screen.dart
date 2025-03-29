import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wazzifni_admin/features/users/ui/widgets/account_info_widget.dart';
import 'package:wazzifni_admin/features/users/ui/widgets/cv_widget.dart';
import 'package:wazzifni_admin/features/users/ui/widgets/languages_list_widget.dart';
import '../../../../../core/boilerplate/create_model/cubits/create_model_cubit.dart';
import '../../../../../core/boilerplate/get_model/cubits/get_model_cubit.dart';
import '../../../../../core/boilerplate/get_model/widgets/get_model.dart';
import '../../../../../core/common/models/education_model.dart';
import '../../../../../core/common/models/profile_model.dart';
import '../../../../../core/common/models/work_experiences_model.dart';
import '../../../../../core/common/style/gaps.dart';
import '../../../../../core/common/style/padding_insets.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/constants/appcolors.dart';
import '../../../core/boilerplate/pagination/cubits/pagination_cubit.dart';
import '../../../core/boilerplate/pagination/widgets/pagination_list.dart';
import '../../../core/common/models/enums.dart';
import '../../../core/common/models/job_application_model.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/utils/utils.dart';
import '../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../core/widgets/image_widgets/custom_image.dart';
import '../../home/ui/root_page.dart';
import '../../job_applications/data/repository/job_application_repository.dart';
import '../../job_applications/data/use_case/get_applications_job_use_case.dart';
import '../../job_applications/ui/widgets/user_apply_card.dart';
import '../../jobs/data/use_case/get_job_use_case.dart';
import '../data/repository/user_repository.dart';
import '../data/use_case/get_user_profile_details_use_case.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.userId});

  final int userId;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // String? cvPath;
  // List<EducationModel> educations = [];
  // List<LanguageModel> languages = [];
  // List<int> selectedSkills = [];
  // List<SkillModel> skillsModel = [];
  // List<WorkExperiencesModel> workExperiences = [];
  late CreateModelCubit profileCubit;
  late GetModelCubit getProfileCubit;
  late PaginationCubit jobsCubit;
  int _selectedIndex = 0;
  final List<String> _labels = ["job_applications".tr(), "account_info".tr()];
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return AdminHomePage(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: GetModel(
                onCubitCreated: (cubit) => getProfileCubit = cubit,
                useCaseCallBack: () {
                  return GetUserProfileUseCase(
                    UserRepository(),
                  ).call(params: GetJobParams(id: widget.userId));
                },
                onSuccess: (model) {},
                modelBuilder: (UserProfileModel? userProfileModel) {
                  return Column(
                    children: [
                      Container(
                        margin: PaddingInsets.normalPaddingAll,
                        padding: PaddingInsets.normalPaddingAll,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: AppColors.primaryGradient,
                          boxShadow: AppColors.boxShadow2,
                        ),
                        child: Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: CustomImage.circular(
                                      radius: 60,
                                      isNetworkImage: true,
                                      image: userProfileModel!.image?.url ?? '',
                                    ),
                                  ),
                                  Gaps.hGap2,
                                  SizedBox(
                                    width: 125,
                                    child: Padding(
                                      padding: PaddingInsets.normalPaddingAll,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            userProfileModel
                                                    .user
                                                    ?.registrationFullName ??
                                                '',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: AppText
                                                .fontSizeMediumTextStyle
                                                .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          Text(
                                            userProfileModel.city?.name ?? '',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: AppText
                                                .fontSizeNormalTextStyle
                                                .copyWith(
                                                  color: AppColors.darkText,
                                                ),
                                          ),
                                          Text(
                                            userProfileModel
                                                    .user
                                                    ?.phoneNumber ??
                                                '',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: AppText
                                                .fontSizeNormalTextStyle
                                                .copyWith(
                                                  color: AppColors.darkText,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  // CustomButton(
                                  //   width: 120,
                                  //   height: 35,
                                  //   isSecondaryGradient: true,
                                  //   text:
                                  //   StatusEnum.values
                                  //       .firstWhere((e) => userProfileModel.status == e.value)
                                  //       .name
                                  //       .tr(),
                                  //   onTap: () async {
                                  //     final RenderBox button =
                                  //     context.findRenderObject() as RenderBox;
                                  //     final RenderBox overlay =
                                  //     Overlay.of(context).context.findRenderObject()
                                  //     as RenderBox;
                                  //
                                  //     // Get the button’s global position
                                  //     final Offset position = button.localToGlobal(
                                  //       Offset.zero,
                                  //       ancestor: overlay,
                                  //     );
                                  //     final Size buttonSize = button.size;
                                  //
                                  //     final selectedValue = await showMenu(
                                  //       context: context,
                                  //       position: RelativeRect.fromLTRB(
                                  //         position.dx + 15, // X position (left)
                                  //         position.dy +
                                  //             buttonSize.height -
                                  //             170, // Adjust Y position with a smaller offset
                                  //         position.dx + buttonSize.width, // Right boundary
                                  //         position.dy +
                                  //             buttonSize.height +
                                  //             100, // Bottom boundary (not really used)
                                  //       ),
                                  //       items:
                                  //       StatusEnum.values
                                  //           .map(
                                  //             (e) => PopupMenuItem(
                                  //           value: e.value,
                                  //           child: Text(
                                  //             e.name.tr(),
                                  //             style: AppText.fontSizeNormalTextStyle,
                                  //           ),
                                  //         ),
                                  //       )
                                  //           .toList(),
                                  //     );
                                  //     if (selectedValue != null) {
                                  //       int currentStatus =
                                  //           StatusEnum.values
                                  //               .firstWhere(
                                  //                 (e) => userProfileModel. == e.value,
                                  //           )
                                  //               .value;
                                  //       if (selectedValue == currentStatus) {
                                  //         return;
                                  //       }
                                  //       if (selectedValue == 2) {
                                  //         // await ApproveCompanyUseCase(CompanyRepository())
                                  //         //     .call(
                                  //         //   params: ApproveCompanyParams(
                                  //         //     id: widget.company.id!,
                                  //         //   ),
                                  //         // )
                                  //         //     .then((value) {
                                  //         //   widget.onChangeStatus();
                                  //         // });
                                  //       } else if (selectedValue == 3) {
                                  //
                                  //       } else {}
                                  //     }
                                  //   },
                                  // ),
                                  Gaps.hGap2,
                                  SizedBox(
                                    height: 40,
                                    child: ToggleButtons(
                                      borderRadius: BorderRadius.circular(10),
                                      selectedBorderColor:
                                          AppColors.darkPrimaryColor,
                                      selectedColor: Colors.white,
                                      disabledColor: Colors.white,
                                      fillColor: AppColors.primaryColor,
                                      color: Colors.black,
                                      isSelected: List.generate(
                                        _labels.length,
                                        (index) => index == _selectedIndex,
                                      ),
                                      onPressed: (int index) {
                                        setState(() {
                                          _selectedIndex = index;
                                        });
                                        // widget.onChangeIndex(index);
                                      },
                                      children:
                                          _labels
                                              .map(
                                                (label) => Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 12,
                                                      ),
                                                  child: Text(label),
                                                ),
                                              )
                                              .toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      _selectedIndex == 0
                          ? Expanded(
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
                                  return GetApplicationJobsListUseCase(
                                    JobApplicationRepository(),
                                  ).call(
                                    params: GetApplicationJobsParams(
                                      request: model,
                                      profileId: userProfileModel.id,
                                    ),
                                  );
                                },
                                listBuilder: (list) {
                                  return LayoutBuilder(
                                    builder: (context, constraints) {
                                      int itemsPerRow =
                                          Utils.calculateRowItemsCount(
                                            constraints,
                                            275,
                                          );
                                      List<Widget> items = List.generate(
                                        list.length,
                                        (index) => UserApplyCard(
                                          jobApplicationModel: list[index],
                                          onDelete: () {},
                                        ),
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
                          )
                          : Expanded(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: PaddingInsets.normalPaddingAll,
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Gaps.vGap2,
                                        Text(
                                          'main_info'.tr(),
                                          style: AppText.fontSizeMediumTextStyle
                                              .copyWith(
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Gaps.vGap2,
                                        // workExperiences.isNotEmpty
                                        //     ? workExperiences
                                        //     .map((e) => WorkExperienceWidget(
                                        //   e: e,
                                        // ))
                                        //     .toList()
                                        //Work Experience
                                        AccountInfoWidget(
                                          title: 'experience'.tr(),
                                          iconPath: AppAssets.jobIcon,
                                          isWithAdd: false,
                                          isWithEdit: false,
                                          onTap: () async {},
                                          body: Column(
                                            children:
                                                userProfileModel
                                                    .workExperiences!
                                                    .map(
                                                      (e) =>
                                                          WorkExperienceWidget(
                                                            e: e,
                                                          ),
                                                    )
                                                    .toList(),
                                          ),
                                        ),
                                        // languages.isNotEmpty
                                        //     ? languages
                                        //     .map((e) => e.displayName ?? '')
                                        //     .toList()
                                        //Languages
                                        AccountInfoWidget(
                                          title: 'languages'.tr(),
                                          iconPath: AppAssets.languageIcon,
                                          isWithAdd: false,
                                          isWithEdit: false,
                                          onTap: () {},
                                          body: LanguagesListWidget(
                                            languages:
                                                userProfileModel
                                                    .spokenLanguages!
                                                    .map(
                                                      (e) =>
                                                          e
                                                              .spokenLanguage!
                                                              .displayName ??
                                                          '',
                                                    )
                                                    .toList(),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Gaps.vGap2,
                                        Text(
                                          'extra_info'.tr(),
                                          style: AppText.fontSizeMediumTextStyle
                                              .copyWith(
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Gaps.vGap2,
                                        // educations.isNotEmpty
                                        //     ? educations
                                        //     .map((e) => EducationWidget(
                                        //   e: e,
                                        // ))
                                        //     .toList()
                                        //Educations
                                        if (userProfileModel.educations != null)
                                          AccountInfoWidget(
                                            title: 'education_level'.tr(),
                                            iconPath: AppAssets.schoolIcon,
                                            isWithAdd: false,
                                            isWithEdit: false,
                                            onTap: () {},
                                            body: Column(
                                              children:
                                                  userProfileModel.educations!
                                                      .map(
                                                        (e) => EducationWidget(
                                                          e: e,
                                                        ),
                                                      )
                                                      .toList(),
                                            ),
                                          ),
                                        //CV
                                        if (userProfileModel.cv != null)
                                          AccountInfoWidget(
                                            title: 'cv'.tr(),
                                            iconPath: AppAssets.cvIcon,
                                            isWithAdd: false,
                                            isWithEdit: false,
                                            onTap: () {},
                                            body: CvWidget(
                                              isWithDelete: false,
                                              fileUrl: userProfileModel.cv?.url,
                                            ),
                                          ),
                                        // skillsModel.isNotEmpty
                                        //     ? skillsModel
                                        //     .map((e) => e.name ?? '')
                                        //     .toList()
                                        //Skills
                                        if (userProfileModel.skills != null &&
                                            userProfileModel.skills!.isNotEmpty)
                                          AccountInfoWidget(
                                            title: 'skills'.tr(),
                                            iconPath: AppAssets.cvIcon,
                                            isWithAdd: false,
                                            isWithEdit: false,
                                            onTap: () {},
                                            body: LanguagesListWidget(
                                              languages:
                                                  userProfileModel.skills!
                                                      .map((e) => e.name ?? '')
                                                      .toList(),
                                            ),
                                          ),
                                        Gaps.vGap2,
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EducationWidget extends StatelessWidget {
  const EducationWidget({super.key, required this.e});

  final EducationModel e;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 100.w),
        Text(
          e.fieldOfStudy ?? '',
          style: AppText.fontSizeNormalTextStyle.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        Gaps.vGap1,
        Text(e.institutionName ?? '', style: AppText.fontSizeNormalTextStyle),
        Text(
          '${e.startDate?.year ?? ''} - ${e.endDate?.year ?? ''}',
          style: AppText.fontSizeNormalTextStyle,
        ),
        Divider(),
      ],
    );
  }
}

class WorkExperienceWidget extends StatelessWidget {
  const WorkExperienceWidget({super.key, required this.e});

  final WorkExperiencesModel e;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 100.w),
        Text(
          e.companyName ?? '',
          style: AppText.fontSizeNormalTextStyle.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        Gaps.vGap1,
        Text(e.jobTitle ?? '', style: AppText.fontSizeNormalTextStyle),
        Text(
          '${e.startDate?.year ?? ''} - ${e.endDate?.year ?? ''}',
          style: AppText.fontSizeNormalTextStyle,
        ),
        Divider(),
      ],
    );
  }
}
