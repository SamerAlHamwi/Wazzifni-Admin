

import 'package:flutter/material.dart';
import 'package:wazzifni_admin/core/constants/appcolors.dart';
import 'package:wazzifni_admin/features/home/ui/widgets/admin_sidebar.dart';
import 'package:wazzifni_admin/features/home/ui/widgets/admin_top_bar.dart';


class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key, required this.child});

  final Widget child;

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
                      child: child,
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


