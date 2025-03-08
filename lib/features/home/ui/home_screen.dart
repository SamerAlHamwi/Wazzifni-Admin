

import 'package:flutter/material.dart';
import 'package:wazzifni_admin/features/home/ui/widgets/home_latest_jobs.dart';
import 'package:wazzifni_admin/features/home/ui/widgets/home_latest_users.dart';
import 'package:wazzifni_admin/features/home/ui/widgets/home_statistics_widget.dart';
import 'package:wazzifni_admin/features/home/ui/widgets/job_applications_chart.dart';
import '../../../core/common/style/gaps.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          JobApplicationsChart(),
          HomeStatistics(),
          HomeLatestJobs(),
          HomeLatestUsers(),
          Gaps.vGap2,
        ],
      ),
    );
  }
}


