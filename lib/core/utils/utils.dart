

import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wazzifni_admin/core/constants/appcolors.dart';
import 'package:wazzifni_admin/core/utils/storage/storage.dart';
import '../common/models/enums.dart';
import 'package:timeago/timeago.dart' as timeago;


class Utils{

  static int calculateRowItemsCount(constraints,itemWidth){
    int itemsPerRow =
    (constraints.maxWidth / itemWidth)
        .floor();
    itemsPerRow =
    itemsPerRow > 0
        ? itemsPerRow
        : 1;
    return itemsPerRow;
  }

  static String getPostStatus(int status) {
    switch (WorkApplicationStatus.values[status]) {
      case WorkApplicationStatus.pending:
        return 'pending'.tr();
      case WorkApplicationStatus.approved:
        return 'approved'.tr();
      case WorkApplicationStatus.rejected:
        return 'rejected'.tr();
      default:
        return 'unknown'.tr();
    }
  }

  static String getFileNameFromUrl(String url) {
    return Uri.parse(url).pathSegments.last;
  }

  static String getTimeAgo(DateTime time){
    String timeAgo = timeago.format(time);
    return timeAgo;
  }

  static void showToast(
      String message,
      ) async {
    await Fluttertoast.showToast(
        textColor: AppColors.white,
        backgroundColor: AppColors.primaryColor,
        fontSize: 14,
        toastLength: Toast.LENGTH_LONG,
        msg: message,
        gravity: ToastGravity.CENTER
    );
  }

  static Future<List<PlatformFile>> pickFiles({bool isMulti = false, bool isImages = true}) async {
    if (await _requestPermission(isImages)) {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: isMulti,
        type: FileType.custom,
        allowedExtensions: isImages ? ['jpg', 'jpeg', 'png', 'webp'] : ['pdf', 'doc', 'docx'],
      );

      return result?.files ?? [];
    }
    return [];
  }

  static Future<bool> _requestPermission(bool isImages) async {
    PermissionStatus status;
    if (isImages) {
      status = await Permission.photos.request(); // For images
    } else {
      status = await Permission.mediaLibrary.request(); // For documents
    }

    return status.isGranted;
  }


  static logout(){
    SharedStorage.logout();
    // Navigation.pushReplacement(const WelcomeScreen());
  }
}