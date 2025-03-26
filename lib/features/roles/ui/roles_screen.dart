

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wazzifni_admin/core/common/style/gaps.dart';
import 'package:wazzifni_admin/core/common/style/padding_insets.dart';
import 'package:wazzifni_admin/core/constants/appcolors.dart';
import 'package:wazzifni_admin/features/home/ui/root_page.dart';
import 'package:wazzifni_admin/features/roles/data/repository/roles_repository.dart';
import '../../../core/boilerplate/pagination/cubits/pagination_cubit.dart';
import '../../../core/boilerplate/pagination/widgets/pagination_list.dart';
import '../../../core/constants/app_textStyle.dart';
import '../../../core/widgets/custom_widgets/custom_textfield.dart';
import '../data/model/role_model.dart';
import '../data/use_case/get_roles_use_case.dart';


class RolesScreen extends StatefulWidget {
  const RolesScreen({super.key});

  @override
  State<RolesScreen> createState() => _RolesScreenState();
}

class _RolesScreenState extends State<RolesScreen> {
  TextEditingController controller = TextEditingController();
  late PaginationCubit usersCubit;

  @override
  Widget build(BuildContext context) {
    return AdminHomePage(
      child: Column(
        children: [
          Padding(
            padding: PaddingInsets.bigPaddingAll,
            child: Row(
              children: [
                Container(
                  height: 48,
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    boxShadow: AppColors.boxShadow2,
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    padding: PaddingInsets.bigPaddingHV,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'roles'.tr(),
                        style: AppText.fontSizeNormalTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Gaps.hGap1,
                Expanded(
                  child: CustomTextField(
                    controller: controller,
                    keyboardType: TextInputType.text,
                    hintText: 'search_hint'.tr(),
                    onFieldSubmitted: (value){
                      usersCubit.getList();
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: PaddingInsets.bigPaddingAll,
              margin: PaddingInsets.bigPaddingAll,
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: AppColors.boxShadow2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: PaginationList<RoleModel>(
                paddingTextErrorWidget: 4,
                onCubitCreated: (cubit) => usersCubit = cubit,
                repositoryCallBack: (model) {
                  return GetRolesUseCase(RolesRepository())
                      .call(params: GetRolesParams(
                      request: model,
                      keyword: controller.text.trim(),
                    ),
                  );
                },
                listBuilder: (list) {
                  return ListView.builder(
                      itemCount: list.length,
                      padding: PaddingInsets.bigPaddingHorizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: PaddingInsets.normalPaddingAll,
                          margin: PaddingInsets.lowPaddingVertical,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.lightText.withValues(alpha: 0.1),
                          ),
                          child: ListTile(
                            minLeadingWidth: 2,
                            leading: Text(
                              '${index+1}',
                              style: AppText.fontSizeNormalTextStyle.copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            title: Text(
                              list[index].displayName ?? '',
                              style: AppText.fontSizeNormalTextStyle,
                            ),
                            subtitle: Wrap(
                              children: List.generate(
                                  list[index].grantedPermissions!.length,
                                  (i)=> Container(
                                    padding: PaddingInsets.lowPaddingAll,
                                    margin: PaddingInsets.lowPaddingAll,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: AppColors.darkPrimaryColor.withValues(alpha: 0.1),
                                    ),
                                    child: Text(
                                      list[index].grantedPermissions![i] ?? '',
                                      style: AppText.fontSizeNormalTextStyle,
                                    ),
                                  ),
                              ),
                            ),
                          ),
                        );
                      });
                },
                withPagination: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}




