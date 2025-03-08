

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/boilerplate/create_model/cubits/create_model_cubit.dart';
import '../../../../../core/common/models/enums.dart';
import '../../../../../core/constants/Validators.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../../../core/widgets/custom_widgets/custom_textfield.dart';
import '../../../../../core/widgets/pages/background_page.dart';
import '../../../core/boilerplate/create_model/widgets/create_model.dart';
import '../../../core/common/style/gaps.dart';
import '../../../core/common/style/padding_insets.dart';
import '../../../core/constants/appcolors.dart';
import '../../../core/utils/Navigation/Navigation.dart';
import '../../home/ui/root_page.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController controller = TextEditingController();
  late CreateModelCubit loginCubit;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
      body: SingleChildScrollView(
        child: Container(
          width: 400,
          padding: PaddingInsets.extraBigPaddingAll,
          margin: PaddingInsets.extraBigPaddingAll,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: AppColors.boxShadow,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gaps.vGap2,
                Image.asset(
                  AppAssets.logo,
                  width: 150,
                  height: 150,
                ),
                Gaps.vGap2,
                Text(
                  'welcome_back'.tr(),
                  style: AppText.fontSizeExtraLargeTextStyle,
                ),
                Text(
                  'login_hint'.tr(),
                  style: AppText.fontSizeNormalTextStyle,
                ),
                Gaps.vGap4,
                SizedBox(
                  width: 70.w,
                  child: CustomTextField(
                      controller: controller,
                      keyboardType: TextInputType.phone,
                      labelText: 'user_name'.tr(),
                  ),
                ),
                Gaps.vGap2,
                SizedBox(
                  width: 70.w,
                  child: CustomTextField(
                    controller: controller,
                    keyboardType: TextInputType.phone,
                    labelText: 'password'.tr(),
                  ),
                ),
                Gaps.vGap4,
                // CreateModel(
                //   onCubitCreated: (cubit) => loginCubit = cubit,
                //   useCaseCallBack: (model) {
                //     return LoginUseCase(AuthRepository()).call(
                //       params: model,
                //     );
                //   },
                //   onSuccess: (LoginModel model) {
                //     // Navigation.push(
                //     //   VerifyPhoneScreen(
                //     //     code: model.code,
                //     //     loginParams: LoginParams(
                //     //         dialCode: '+964',
                //     //         phoneNumber: controller.text.trim(),
                //     //         userType: UserType.user.index,
                //     //         language: context.locale.languageCode,
                //     //         isForSignIn: true,
                //     //     ),
                //     //   ),
                //     // );
                //   },
                //   withValidation: false,
                //   child: CustomButton(
                //     text: 'login'.tr(),
                //     onTap: () {
                //       // if(controller.text.length == 10){
                //       //   loginCubit.createModel(
                //       //       requestData: LoginParams(
                //       //         dialCode: '+964',
                //       //         phoneNumber: controller.text.trim(),
                //       //         userType: UserType.user.index,
                //       //       ));
                //       // }else{
                //       //   Utils.showToast("invalid_phone_number".tr());
                //       // }
                //     },
                //   ),
                // ),
                CustomButton(
                  text: 'login'.tr(),
                  onTap: () {
                    Navigation.push(AdminHomePage());
                  },
                ),
                Gaps.vGap2,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
