




import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wazzifni_admin/core/constants/appcolors.dart';
import '../../../../core/common/models/enums.dart';
import '../../../../core/common/models/job_model.dart';
import '../../../../core/constants/Validators.dart';
import '../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../../core/widgets/custom_widgets/custom_range_slider_widget.dart';
import '../../../../core/widgets/custom_widgets/custom_wrap_expansion_tile.dart';
import '../../../core/boilerplate/create_model/cubits/create_model_cubit.dart';
import '../../../core/boilerplate/create_model/widgets/create_model.dart';
import '../../../core/common/style/gaps.dart';
import '../../../core/common/style/padding_insets.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_textStyle.dart';
import '../../../core/widgets/custom_widgets/custom_slider_widget.dart';
import '../../../core/widgets/custom_widgets/custom_textfield.dart';
import '../../companies/ui/widgets/company_info_widget.dart';
import '../data/repository/add_job_repository.dart';
import '../data/use_case/add_job_use_case.dart';
import '../data/use_case/delete_work_post_use_case.dart';



class AddJobScreen extends StatefulWidget {
  const AddJobScreen({super.key, this.jobModel});

  final JobModel? jobModel;

  @override
  State<AddJobScreen> createState() => _AddJobScreenState();
}

class _AddJobScreenState extends State<AddJobScreen> {


  TextEditingController jobName = TextEditingController();
  TextEditingController jobDescription = TextEditingController();
  String jobType = WorkEngagement.full_time.name;
  String workLevel = WorkLevel.team_leader.name;
  String workPlace = WorkPlace.onSite.name;
  RangeValues salary = const RangeValues(100, 500);
  String educationLevel = EducationLevel.high_school.name;
  double experience = 1;
  double employeesCount = 1;
  AddJobParams addJobParams = AddJobParams();
  late CreateModelCubit publishCubit;

  @override
  void initState() {
    super.initState();
    initData();
  }

  initData(){
    if(widget.jobModel != null){
      jobName.text = widget.jobModel!.title ?? '';
      jobDescription.text = widget.jobModel!.description ?? '';
      jobType = WorkEngagement.values.where((element) => element.index == widget.jobModel!.workEngagement).first.name;
      workLevel = WorkLevel.values.where((element) => element.index == widget.jobModel!.workLevel).first.name;
      workPlace = WorkPlace.values.where((element) => element.index == widget.jobModel!.workPlace).first.name;
      experience = widget.jobModel!.experienceYearsCount!.toDouble();
      employeesCount = widget.jobModel!.requiredEmployeesCount!.toDouble();
      educationLevel = EducationLevel.values.where((element) => element.value == widget.jobModel!.educationLevel).first.name;
      salary = RangeValues(widget.jobModel!.minSalary!, widget.jobModel!.maxSalary!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: PaddingInsets.bigPaddingAll,
            margin: PaddingInsets.bigPaddingHV,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.primaryColor),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage(AppAssets.companyLogo),
                  ),
                ),
                Gaps.vGap1,
                Text(
                    "شركة البراء",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppText.fontSizeMediumTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    )
                ),
                Gaps.vGap2,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CompanyInfoBox(
                      title: 'number_of_employees'.tr(),
                      subTitle: '${50} ${'employee'.tr()}',
                    ),
                    Gaps.hGap2,
                    CompanyInfoBox(
                      title: 'company_location'.tr(),
                      subTitle: 'بغداد',
                    ),
                    Gaps.hGap2,
                    CompanyInfoBox(
                      title: 'company_establishment_date'.tr(),
                      subTitle: '2024',
                    ),
                  ],
                ),
                Gaps.vGap2,
              ],
            ),
          ),
          Container(
            padding: PaddingInsets.bigPaddingAll,
            margin: PaddingInsets.bigPaddingHV,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.primaryColor),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextField(
                  controller: jobName,
                  labelText: 'job_name'.tr(),
                  isRequired: true,
                  validator: Validators.validateEmptyValue,
                ),
                Gaps.vGap2,
                CustomTextField(
                  controller: jobDescription,
                  labelText: 'job_description'.tr(),
                  maxLines: 3,
                  isRequired: true,
                  validator: Validators.validateEmptyValue,
                ),
                Gaps.vGap1,
                CustomWrapExpansionTile(
                  title: "job_type".tr(),
                  selectedOption: jobType,
                  items: WorkEngagement.values.map((e) => e.name).toList(),
                  isRequired: true,
                  isExpanded: true,
                  onChanged: (value) {
                    setState(() {
                      jobType = value;
                    });
                  },
                ),
                Gaps.vGap1,
                CustomWrapExpansionTile(
                  title: "job_location".tr(),
                  selectedOption: workLevel,
                  items: WorkLevel.values.map((e) => e.name).toList(),
                  isRequired: true,
                  isExpanded: true,
                  onChanged: (value) {
                    setState(() {
                      workLevel = value;
                    });
                  },
                ),
                Gaps.vGap1,
                CustomWrapExpansionTile(
                  title: "work_location".tr(),
                  selectedOption: workPlace,
                  items: WorkPlace.values.map((e) => e.name).toList(),
                  isRequired: true,
                  isExpanded: true,
                  onChanged: (value) {
                    setState(() {
                      workPlace = value;
                    });
                  },
                ),
                Gaps.vGap1,
                CustomRangeSliderWidget(
                  title: 'expected_salary'.tr(),
                  max: 5000,
                  min: 100,
                  rangeValues: salary,
                  isRequired: true,
                  onChanged: (value) {
                    setState(() {
                      salary = value;
                    });
                  },
                ),
                Gaps.vGap2,
                CustomButton(
                  isSecondaryGradient: true,
                  text: 'extra_info'.tr(),
                  onTap: () {

                  },
                ),
                Gaps.vGap2,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomWrapExpansionTile(
                      title: "education_level".tr(),
                      selectedOption: educationLevel,
                      items: EducationLevel.values.map((e) => e.name).toList(),
                      isExpanded: true,
                      onChanged: (value){
                        setState(() {
                          educationLevel = value;
                        });
                      },
                    ),
                    Gaps.vGap1,
                    CustomSliderWidget(
                      title: 'years_of_experience'.tr(),
                      max: 10,
                      min: 1,
                      currentValue: experience,
                      onChanged: (value){
                        setState(() {
                          experience = value.toDouble();
                        });
                      },
                    ),
                    Gaps.vGap1,
                    CustomSliderWidget(
                      title: 'num_of_employees'.tr(),
                      max: 10,
                      min: 1,
                      currentValue: employeesCount,
                      onChanged: (value){
                        setState(() {
                          employeesCount = value.toDouble();
                        });
                      },
                    ),
                    Gaps.vGap2,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CreateModel(
                          onCubitCreated: (cubit) => publishCubit = cubit,
                          useCaseCallBack: (model) {
                            return CreateJobUseCase(AddJobsRepository()).call(
                              params: model,
                            );
                          },
                          onSuccess: (model) {

                          },
                          withValidation: false,
                          child: CustomButton(
                            width: 150,
                            text: 'publish'.tr(),
                            onTap: () {
                              // if(jobName.text.isNotEmpty && jobDescription.text.isNotEmpty){
                              //   Navigation.push(
                              //     ExtraAddJobScreen(
                              //       addJobParams: addJobParams.copyWith(
                              //         title: jobName.text.trim(),
                              //         description: jobDescription.text.trim(),
                              //         workEngagement: WorkEngagement.values.where((element) => element.name == jobType).first.value,
                              //         workLevel: WorkLevel.values.where((element) => element.name == workLevel).first.value,
                              //         workPlace: WorkPlace.values.where((element) => element.name == workPlace).first.value,
                              //         minSalary: salary.start.toInt(),
                              //         maxSalary: salary.end.toInt(),
                              //       ),
                              //       jobModel: widget.jobModel,
                              //     ),
                              //   );
                              // }else{
                              //   Utils.showToast('please_fill_required_fields'.tr());
                              // }
                              // publishCubit.createModel(
                              //   requestData: widget.addJobParams.copyWith(
                              //     educationLevel: EducationLevel.values.where((element) => element.name == educationLevel).first.value,
                              //     experienceYearsCount: experience.toInt(),
                              //     requiredEmployeesCount: employeesCount.toInt(),
                              //     isEdit: widget.jobModel != null ? true : false,
                              //     id: widget.jobModel?.id!,
                              //   ),
                              // );
                            },
                          ),
                        ),
                        Gaps.hGap2,
                        CreateModel(
                          onCubitCreated: (cubit) => publishCubit = cubit,
                          useCaseCallBack: (model) {
                            return DeleteJobUseCase(AddJobsRepository()).call(
                              params: model,
                            );
                          },
                          onSuccess: (model) {

                          },
                          withValidation: false,
                          child: CustomButton(
                            width: 150,
                            isSecondaryGradient: true,
                            text: 'delete_job'.tr(),
                            onTap: () {

                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Gaps.vGap2,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
