

import 'package:go_router/go_router.dart';
import 'core/common/models/job_model.dart';
import 'features/companies/ui/companies_screen.dart';
import 'features/companies/ui/company_details_screen.dart';
import 'features/home/ui/home_screen.dart';
import 'features/job_applications/ui/job_applications_screen.dart';
import 'features/jobs/ui/jobs_screen.dart';
import 'features/login/ui/login_screen.dart';
import 'features/notifications/ui/notifications_screen.dart';
import 'features/publish_job/ui/publish_job_screen.dart';
import 'features/roles/ui/roles_screen.dart';
import 'features/splash/ui/splash_screen.dart';
import 'features/users/ui/user_details_screen.dart';
import 'features/users/ui/users_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/users',
      builder: (context, state) => const UsersScreen(),
    ),
    GoRoute(
      path: '/user-details',
      builder: (context, state) {
        final userId = state.extra as int?;
        return ProfileScreen(userId: userId!);
      },
    ),
    GoRoute(
      path: '/companies',
      builder: (context, state) => const CompaniesScreen(),
    ),
    GoRoute(
      path: '/company-details/:companyId',
      builder: (context, state) {
        final companyId = int.tryParse(state.pathParameters['companyId'] ?? '0') ?? 0;
        return CompanyDetailsScreen(companyId: companyId);
      },
    ),
    GoRoute(
      path: '/jobs',
      builder: (context, state) => const JobsScreen(),
    ),
    GoRoute(
      path: '/job-applications',
      builder: (context, state) {
        final workPostId = state.extra as int?;
        return JobApplicationsScreen(workPostId: workPostId);
      },
    ),
    GoRoute(
      path: '/add-job',
      builder: (context, state) {
        final jobModel = state.extra as JobModel?;
        return AddJobScreen(jobModel: jobModel);
      },
    ),
    GoRoute(
      path: '/notifications',
      builder: (context, state) => const NotificationsScreen(),
    ),
    GoRoute(
      path: '/roles',
      builder: (context, state) => const RolesScreen(),
    ),
  ],
);


