

import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:open_file/open_file.dart';
import 'package:file_picker/file_picker.dart';
import '../../../../../core/common/style/gaps.dart';
import '../../../../../core/common/style/padding_insets.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/constants/appcolors.dart';
import '../../../../core/utils/utils.dart';



class CvWidget extends StatefulWidget {
  CvWidget({
    super.key,
    this.filePath,
    this.fileUrl,
    this.onChanged,
    this.isWithDelete = true,
  });

  String? filePath;
  String? fileUrl;
  Function(String?)? onChanged;
  final bool isWithDelete;

  @override
  State<CvWidget> createState() => _CvWidgetState();
}

class _CvWidgetState extends State<CvWidget> {
  String name = '';

  void _openCv() async {
    if (widget.fileUrl != null && widget.fileUrl!.isNotEmpty) {
      final Uri url = Uri.parse(Uri.encodeFull(widget.fileUrl!));
      // if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
      // } else {
      //   debugPrint("Could not launch $url");
      // }
    } else if (widget.filePath != null && widget.filePath!.isNotEmpty) {
      OpenFile.open(widget.filePath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.filePath != null || widget.fileUrl != null
        ? GestureDetector(
      onTap: _openCv,
      child: Container(
          width: 100.w,
          padding: PaddingInsets.bigPaddingAll,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            boxShadow: AppColors.boxShadow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    AppAssets.pdf,
                    width: 40,
                    height: 40,
                  ),
                  Gaps.hGap2,
                  SizedBox(
                    width: 58.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.fileUrl != null ? Utils.getFileNameFromUrl(widget.fileUrl!) : name,
                          style: AppText.fontSizeNormalTextStyle.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              widget.isWithDelete
                  ? const Icon(
                Icons.delete_outline_outlined,
                color: AppColors.red,
              )
                  : const SizedBox(),
            ],
          )),
    ) : GestureDetector(
      onTap: () async {
        List<PlatformFile> file = await Utils.pickFiles(isImages: false);

        if (file.isNotEmpty) {
          setState(() {
            widget.filePath = file.first.path;
            name = file.first.name;
          });
          widget.onChanged!(file.first.path);
        }
      },
      child: Center(
        child: CustomPaint(
          painter: DashedBorderPainter(),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.uploadCV,
                  width: 40,
                  height: 40,
                ),
                Gaps.hGap2,
                Text(
                  tr("upload_resume"),
                  style: AppText.fontSizeNormalTextStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final Path path = Path()
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        const Radius.circular(12),
      ));

    const double dashWidth = 6.0;
    const double dashSpace = 4.0;
    double distance = 0.0;

    for (PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        final double end = (distance + dashWidth).clamp(0, pathMetric.length);
        canvas.drawPath(pathMetric.extractPath(distance, end), paint);
        distance += dashWidth + dashSpace;
      }
      distance = 0.0;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
