

import 'package:flutter/material.dart';
import 'package:wazzifni_admin/core/common/style/padding_insets.dart';
import 'package:wazzifni_admin/core/constants/appcolors.dart';
import 'package:wazzifni_admin/features/home/ui/widgets/admin_sidebar.dart';
import 'package:wazzifni_admin/features/home/ui/widgets/admin_top_bar.dart';

import '../../companies/ui/companies_screen.dart';
import '../../companies/ui/company_details_screen.dart';
import '../../jobs/ui/jobs_screen.dart';
import '../../notifications/ui/notifications_screen.dart';
import '../../users/ui/users_screen.dart';


class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldWhite,
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isSmallScreen = constraints.maxWidth < 800;
          return Row(
            children: [
              if (!isSmallScreen) const AdminSidebar(),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AdminTopBar(isSmallScreen: isSmallScreen),
                    Expanded(
                      child: CompanyDetailsScreen(companyId: 1,)
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      drawer: MediaQuery.of(context).size.width < 800
          ? const Drawer(child: AdminSidebar())
          : null,
    );
  }
}


