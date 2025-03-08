


import 'package:flutter/material.dart';
import 'package:wazzifni_admin/features/companies/ui/widgets/company_header_widget.dart';
import 'package:wazzifni_admin/features/companies/ui/widgets/company_jobs_list.dart';
import 'package:wazzifni_admin/features/companies/ui/widgets/company_profile_widget.dart';



class CompanyDetailsScreen extends StatefulWidget {
  const CompanyDetailsScreen({super.key, required this.companyId});

  final int companyId;

  @override
  State<CompanyDetailsScreen> createState() => _CompanyDetailsScreenState();
}

class _CompanyDetailsScreenState extends State<CompanyDetailsScreen> {

  bool isProfile = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CompanyHeaderWidget(),
        Expanded(child: isProfile ? CompanyProfile(companyId: widget.companyId,) : CompanyJobsWidget()),
      ],
    );
  }
}






