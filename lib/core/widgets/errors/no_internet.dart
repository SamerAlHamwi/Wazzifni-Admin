import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/appcolors.dart';
import '../../constants/app_assets.dart';
import 'base_error_widget.dart';

class NoInternet extends StatefulWidget {
  const NoInternet() : super();

  @override
  _NoInternetState createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: BaseErrorWidget(
            icon: Image.asset(
              AppAssets.connection_error,
              fit: BoxFit.cover,
            ),
            title: 'No internet \n Connection',
            subtitle:
                'your internet connection is currently \n not available please check or try again.',
            button: Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 5),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: const Text(
                'TRY AGAIN',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
