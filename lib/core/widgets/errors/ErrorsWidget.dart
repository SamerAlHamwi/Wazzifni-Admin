import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants/app_assets.dart';
import 'base_error_widget.dart';

class ErrorsWidget extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String? message;

  const ErrorsWidget({Key? key, this.onTap, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseErrorWidget(
        onTap: onTap,
        title: message,
        subtitle: 'Tap to retry'.tr(),
        icon: SvgPicture.asset(
          AppAssets.error,
        ));
  }
}
