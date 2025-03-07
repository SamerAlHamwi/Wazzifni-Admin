




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
import '../../../../../core/common/models/skills_model.dart';
import '../../../../../core/common/models/work_experiences_model.dart';
import '../../../../../core/common/style/gaps.dart';
import '../../../../../core/common/style/padding_insets.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/constants/appcolors.dart';
import '../../../core/common/models/language_model.dart';
import '../../../core/constants/app_assets.dart';
import '../../jobs/data/use_case/get_job_use_case.dart';
import '../data/repository/user_repository.dart';
import '../data/use_case/get_user_profile_details_use_case.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {


  String? cvPath;
  List<EducationModel> educations = [];
  List<LanguageModel> languages = [];
  List<int> selectedSkills = [];
  List<SkillModel> skillsModel = [];
  List<WorkExperiencesModel> workExperiences = [];
  late CreateModelCubit profileCubit;
  late GetModelCubit getProfileCubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: GetModel(
                onCubitCreated: (cubit) => getProfileCubit = cubit,
                useCaseCallBack: () {
                  return GetUserProfileUseCase(UserRepository()).call(
                    params: GetJobParams(
                      id: 1,
                    ),
                  );
                },
                onSuccess: (model) {

                },
                modelBuilder: (UserProfileModel? userProfileModel) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: PaddingInsets.normalPaddingAll,
                      child: Column(
                        children: [
                          Gaps.vGap2,
                          Text(
                            'main_info'.tr(),
                            style: AppText.fontSizeMediumTextStyle
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          Gaps.vGap2,
                          //Work Experience
                          AccountInfoWidget(
                            title: 'experience'.tr(),
                            iconPath: AppAssets.jobIcon,
                            onTap: () async {

                            },
                            body: Column(
                              children: workExperiences.isNotEmpty
                                  ? workExperiences
                                  .map((e) => WorkExperienceWidget(
                                e: e,
                              ))
                                  .toList()
                                  : userProfileModel!.workExperiences!
                                  .map((e) => WorkExperienceWidget(
                                e: e,
                              ))
                                  .toList(),
                            ),
                          ),
                          //Languages
                          AccountInfoWidget(
                            title: 'languages'.tr(),
                            iconPath: AppAssets.languageIcon,
                            isWithEdit: true,
                            onTap: () async {

                            },
                            body: LanguagesListWidget(
                              languages: languages.isNotEmpty
                                  ? languages
                                  .map((e) => e.displayName ?? '')
                                  .toList()
                                  : userProfileModel!.spokenLanguages!
                                  .map((e) =>
                              e.spokenLanguage!.displayName ?? '')
                                  .toList(),
                            ),
                          ),
                          Gaps.vGap2,
                          Text(
                            'extra_info'.tr(),
                            style: AppText.fontSizeMediumTextStyle.copyWith(fontWeight: FontWeight.w600),
                          ),
                          Gaps.vGap2,
                          //Educations
                          if (userProfileModel!.educations != null)
                            AccountInfoWidget(
                              title: 'education_level'.tr(),
                              iconPath: AppAssets.schoolIcon,
                              onTap: () async {

                              },
                              body: Column(
                                children: educations.isNotEmpty
                                    ? educations
                                    .map((e) => EducationWidget(
                                  e: e,
                                ))
                                    .toList()
                                    : userProfileModel.educations!
                                    .map((e) => EducationWidget(
                                  e: e,
                                ))
                                    .toList(),
                              ),
                            ),
                          //CV
                          if (userProfileModel.cv != null)
                            AccountInfoWidget(
                              title: 'cv'.tr(),
                              iconPath: AppAssets.cvIcon,
                              isWithEdit: true,
                              onTap: () {

                              },
                              body: CvWidget(
                                isWithDelete: false,
                                fileUrl: userProfileModel.cv?.url,
                              ),
                            ),
                          //Skills
                          if (userProfileModel.skills != null)
                            AccountInfoWidget(
                              title: 'skills'.tr(),
                              iconPath: AppAssets.cvIcon,
                              isWithAdd: userProfileModel.skills!.isEmpty ? true : false,
                              isWithEdit: userProfileModel.skills!.isNotEmpty ? true : false,
                              onTap: () async {

                              },
                              body: LanguagesListWidget(
                                languages: skillsModel.isNotEmpty
                                    ? skillsModel
                                    .map((e) => e.name ?? '')
                                    .toList()
                                    : userProfileModel.skills!
                                    .map((e) => e.name ?? '')
                                    .toList(),
                              ),
                            ),
                          Gaps.vGap2,
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  showSaveButton() {
    if (cvPath != null ||
        educations.isNotEmpty ||
        languages.isNotEmpty ||
        workExperiences.isNotEmpty ||
        selectedSkills.isNotEmpty) {
      return true;
    }
    return false;
  }

  prepareData(UserProfileModel userProfileModel) {
    if (languages.isEmpty) {
      languages.addAll(userProfileModel.spokenLanguages!
          .map((e) => LanguageModel(
        name: e.spokenLanguage!.name ?? '',
        displayName: e.spokenLanguage!.displayName ?? '',
        id: e.spokenLanguage!.id,
        oralLevel: e.oralLevel,
        writingLevel: e.writingLevel,
        isNative: e.isNative,
      ))
          .toList());
    }
    if(educations.isEmpty){
      educations.addAll(userProfileModel.educations!);
    }
    if(workExperiences.isEmpty){
      workExperiences.addAll(userProfileModel.workExperiences!);
    }
    if(selectedSkills.isEmpty){
      selectedSkills.addAll(userProfileModel.skills!.map((e)=> e.id!).toList());
    }
  }
}

class EducationWidget extends StatelessWidget {
  const EducationWidget({
    super.key,
    required this.e,
  });

  final EducationModel e;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100.w,
        ),
        Text(
          e.fieldOfStudy ?? '',
          style: AppText.fontSizeNormalTextStyle.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        Gaps.vGap1,
        Text(
          e.institutionName ?? '',
          style: AppText.fontSizeNormalTextStyle,
        ),
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
  const WorkExperienceWidget({
    super.key,
    required this.e,
  });

  final WorkExperiencesModel e;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100.w,
        ),
        Text(
          e.companyName ?? '',
          style: AppText.fontSizeNormalTextStyle.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        Gaps.vGap1,
        Text(
          e.jobTitle ?? '',
          style: AppText.fontSizeNormalTextStyle,
        ),
        Text(
          '${e.startDate?.year ?? ''} - ${e.endDate?.year ?? ''}',
          style: AppText.fontSizeNormalTextStyle,
        ),
        Divider(),
      ],
    );
  }
}

// AccountInfoWidget(
//   title: 'account_info'.tr(),
//   iconPath: AppAssets.profileIcon,
//   onTap: () {
//     Navigation.push(const AboutMeScreen());
//   },
//   body: Text(
//     userProfileModel!.about ?? '',
//     style: AppText.fontSizeNormalTextStyle,
//   ),
// ),
