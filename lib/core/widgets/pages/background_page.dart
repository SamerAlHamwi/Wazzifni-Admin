

import 'package:flutter/material.dart';
import 'package:wazzifni_admin/core/constants/app_assets.dart';

class BackgroundPage extends StatelessWidget {
  final Widget body;
  final Widget? drawer;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const BackgroundPage({
    super.key,
    required this.body,
    this.drawer,
    this.scaffoldKey,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: drawer,
      key: scaffoldKey,
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: IgnorePointer(
              child: Image.asset(
                AppAssets.background,
                fit: BoxFit.fill,
              ),
            ),
          ),
          // Body content
          Positioned.fill(
            child: body
          ),
        ],
      ),
    );
  }
}
