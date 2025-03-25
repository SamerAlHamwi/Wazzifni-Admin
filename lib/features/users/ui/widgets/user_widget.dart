



import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wazzifni_admin/core/common/models/profile_model.dart';
import 'package:wazzifni_admin/core/common/style/gaps.dart';
import 'package:wazzifni_admin/core/common/style/padding_insets.dart';
import 'package:wazzifni_admin/core/constants/app_assets.dart';
import 'package:wazzifni_admin/core/constants/app_textStyle.dart';
import 'package:wazzifni_admin/core/constants/appcolors.dart';

import '../../../../core/widgets/image_widgets/custom_image.dart';


class UserWidget extends StatelessWidget {
  const UserWidget({super.key, required this.userProfileModel});

  final UserProfileModel userProfileModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        context.go('/user-details',extra: userProfileModel.id);
      },
      child: Container(
        width: 200,
        height: 100,
        margin: PaddingInsets.normalPaddingHorizontal,
        child: Row(
          children: [
            CustomImage.circular(
              radius: 50,
              isNetworkImage: true,
              image: userProfileModel.image?.url ?? '',
            ),
            Gaps.hGap1,
            SizedBox(
              width: 125,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userProfileModel.user?.registrationFullName ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppText.fontSizeMediumTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${userProfileModel.user?.dialCode ?? ''}-${userProfileModel.user?.phoneNumber ?? ''}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppText.fontSizeNormalTextStyle.copyWith(
                      color: AppColors.darkText,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
