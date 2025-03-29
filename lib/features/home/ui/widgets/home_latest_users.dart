

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/boilerplate/pagination/cubits/pagination_cubit.dart';
import '../../../../core/boilerplate/pagination/widgets/pagination_list.dart';
import '../../../../core/common/models/profile_model.dart';
import '../../../../core/common/style/padding_insets.dart';
import '../../../../core/constants/app_textStyle.dart';
import '../../../../core/constants/appcolors.dart';
import '../../../../core/utils/utils.dart';
import '../../../users/data/repository/user_repository.dart';
import '../../../users/data/use_case/get_users_use_case.dart';
import '../../../users/ui/widgets/user_widget.dart';

class HomeLatestUsers extends StatefulWidget {
  const HomeLatestUsers({
    super.key,
  });

  @override
  State<HomeLatestUsers> createState() => _HomeLatestUsersState();
}

class _HomeLatestUsersState extends State<HomeLatestUsers> {

  late PaginationCubit usersCubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: PaddingInsets.bigPaddingAll,
      margin: PaddingInsets.bigPaddingAll,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: AppColors.boxShadow2,
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'latest_users'.tr(),
                style: AppText.fontSizeNormalTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                  onPressed: (){
                    context.go('/users');
                  },
                  child: Text(
                    'show_all'.tr(),
                    style: AppText.fontSizeSmallTextStyle.copyWith(
                      color: AppColors.gold,
                    ),
                  )
              )
            ],
          ),
          SizedBox(
            height: 210,
            child: PaginationList<UserProfileModel>(
              paddingTextErrorWidget: 4,
              onCubitCreated: (cubit) => usersCubit = cubit,
              repositoryCallBack: (model) {
                return GetUsersUseCase(UserRepository())
                    .call(
                  params: GetUsersParams(
                    request: model,
                  ),
                );
              },
              listBuilder: (list) {
                return
                  LayoutBuilder(
                    builder: (context, constraints) {
                      int itemsPerRow = Utils.calculateRowItemsCount(constraints, 216);
                      List<Widget> items = List.generate(list.length, (index) => UserWidget(userProfileModel: list[index],));

                      return ListView.builder(
                        itemCount: (items.length / itemsPerRow).ceil(),
                        itemBuilder: (context, rowIndex) {
                          int startIndex = rowIndex * itemsPerRow;
                          int endIndex = (startIndex + itemsPerRow).clamp(
                            0,
                            items.length,
                          );
                          List<Widget> rowItems = items.sublist(startIndex, endIndex);

                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: rowItems,
                            ),
                          );
                        },
                      );
                    },
                  );
              },
              withPagination: false,
            ),
          ),
        ],
      ),
    );
  }
}