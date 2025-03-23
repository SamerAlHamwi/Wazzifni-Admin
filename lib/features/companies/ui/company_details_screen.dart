


import 'package:flutter/material.dart';
import 'package:wazzifni_admin/core/boilerplate/get_model/cubits/get_model_cubit.dart';
import 'package:wazzifni_admin/features/companies/ui/widgets/company_header_widget.dart';
import 'package:wazzifni_admin/features/companies/ui/widgets/company_job_application_list.dart';
import 'package:wazzifni_admin/features/companies/ui/widgets/company_jobs_list.dart';
import 'package:wazzifni_admin/features/companies/ui/widgets/company_profile_widget.dart';

import '../../../core/boilerplate/get_model/widgets/get_model.dart';
import '../../../core/common/models/company_model.dart';
import '../../../core/widgets/shimmer/job_details_shimmer.dart';
import '../../job_applications/data/use_case/get_company_use_case.dart';
import '../../jobs/data/use_case/get_job_use_case.dart';
import '../data/repository/company_repository.dart';



class CompanyDetailsScreen extends StatefulWidget {
  const CompanyDetailsScreen({super.key, required this.companyId});

  final int companyId;

  @override
  State<CompanyDetailsScreen> createState() => _CompanyDetailsScreenState();
}

class _CompanyDetailsScreenState extends State<CompanyDetailsScreen> {

  int selectedIndex = 0;
  late GetModelCubit detailsCubit;

  @override
  Widget build(BuildContext context) {
    return GetModel(
      onCubitCreated: (cubit) => detailsCubit = cubit,
      useCaseCallBack: () {
        return GetCompanyDetailsUseCase(CompanyRepository()).call(
          params: GetJobParams(
            id: widget.companyId,
          ),
        );
      },
      onSuccess: (model) {},
      loading: const JobDetailsShimmer(),
      modelBuilder: (Company? company) {
        return Column(
          children: [
            CompanyHeaderWidget(
              company: company!,
              onChangeStatus: (){
                detailsCubit.getModel();
              },
              onChangeIndex: (value){
                setState(() {
                  selectedIndex = value;
                });
              },
            ),
            Expanded(child:
            selectedIndex == 0 ?
              CompanyJobsWidget(companyId: widget.companyId,) :
            selectedIndex == 1 ?
              CompanyJobApplicationList(companyId: widget.companyId,):
                CompanyProfile(company: company,),
            ),
          ],
        );
      },
    );
  }
}






