
import 'package:flutter/material.dart';
import '../../constants/appcolors.dart';
import '../custom_widgets/custom_appbar.dart';


class AppBarPage extends StatelessWidget {
  const AppBarPage({super.key,
    required this.title,
    required this.body,
  });

  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Column(
        children: [
          CustomAppBar(
            title: title,
          ),
          Expanded(
            child: body
          ),
        ],
      ),
    );
  }
}