

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wazzifni_admin/core/utils/storage/storage.dart';
import '../../../../../core/boilerplate/create_model/cubits/create_model_cubit.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../../../core/widgets/custom_widgets/custom_textfield.dart';
import '../../../../../core/widgets/pages/background_page.dart';
import '../../../core/boilerplate/create_model/widgets/create_model.dart';
import '../../../core/common/style/gaps.dart';
import '../../../core/common/style/padding_insets.dart';
import '../../../core/constants/Validators.dart';
import '../../../core/constants/appcolors.dart';
import '../data/model/login_model.dart';
import '../data/repository/auth_repository.dart';
import '../data/use_case/login_use_case.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController controller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late CreateModelCubit loginCubit;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
      body: Container(
        width: 400,
        padding: PaddingInsets.bigPaddingAll,
        margin: PaddingInsets.bigPaddingAll,
        // decoration: BoxDecoration(
        //   color: AppColors.white,
        //   borderRadius: BorderRadius.circular(12),
        //   boxShadow: AppColors.boxShadow,
        // ),
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
                width: 300,
                child: CustomTextField(
                    controller: controller,
                    keyboardType: TextInputType.phone,
                    labelText: 'user_name'.tr(),
                  validator: Validators.validateEmptyValue,
                ),
              ),
              Gaps.vGap2,
              SizedBox(
                width: 300,
                child: CustomTextField(
                  controller: passwordController,
                  keyboardType: TextInputType.phone,
                  labelText: 'password'.tr(),
                  validator: Validators.validateEmptyValue,
                ),
              ),
              Gaps.vGap4,
              CreateModel(
                onCubitCreated: (cubit) => loginCubit = cubit,
                useCaseCallBack: (model) {
                  return LoginUseCase(AuthRepository()).call(
                    params: model,
                  );
                },
                onSuccess: (LoginModel model) {
                  SharedStorage.setToken(model.accessToken ?? '');
                  context.go('/home');
                },
                withValidation: false,
                child: CustomButton(
                  text: 'login'.tr(),
                  width: 300,
                  onTap: () async {
                    if(_formKey.currentState!.validate()){
                      loginCubit.createModel(
                          requestData: LoginParams(
                            userNameOrEmailAddress: controller.text.trim(),
                            password: passwordController.text.trim(),
                          ));
                    }
                  },
                ),
              ),
              Gaps.vGap2,
            ],
          ),
        ),
      ),
    );
  }
}
