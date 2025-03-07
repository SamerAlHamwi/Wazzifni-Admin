import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:wazzifni_admin/core/utils/utils.dart';
import '../../constants/app_assets.dart';
import '../../constants/appcolors.dart';

class ProfileImageWidget extends StatefulWidget {
  String? imagePath;
  String? imageUrl;
  double? width;
  double? height;
  final bool isCircle;
  final bool isWithSelect;

  final Function(String) onChanged;

  ProfileImageWidget({
    super.key,
    this.imagePath,
    this.imageUrl,
    this.width,
    this.height,
    this.isCircle = true,
    this.isWithSelect = true,
    required this.onChanged,
  });

  @override
  State<ProfileImageWidget> createState() => _ProfileImageWidgetState();
}

class _ProfileImageWidgetState extends State<ProfileImageWidget> {
  @override
  Widget build(BuildContext context) {
    ImageProvider imageProvider;

    if (widget.imagePath != null && widget.imagePath!.isNotEmpty) {
      imageProvider = FileImage(File(widget.imagePath!));
    } else if (widget.imageUrl != null && widget.imageUrl!.isNotEmpty) {
      imageProvider = NetworkImage(widget.imageUrl!);
    } else {
      imageProvider = const AssetImage(AppAssets.cameraIcon);
    }

    return GestureDetector(
      onTap: widget.isWithSelect
          ? () async {
        List<PlatformFile> image = await Utils.pickFiles();
        if (image.isNotEmpty) {
          setState(() {
            widget.imagePath = image.first.path;
          });
          widget.onChanged(widget.imagePath ?? '');
        }
      }
          : null,
      child: Container(
        width: widget.width ?? 100,
        height: widget.height ?? 100,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          shape: widget.isCircle ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: widget.isCircle ? null : BorderRadius.circular(12),
          boxShadow: AppColors.boxShadow,
          image: DecorationImage(
            image: imageProvider,
            fit: (widget.imagePath == null && widget.imageUrl == null) ? null : BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
