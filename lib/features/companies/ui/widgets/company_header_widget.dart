



import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wazzifni_admin/core/common/style/gaps.dart';
import 'package:wazzifni_admin/core/common/style/padding_insets.dart';
import 'package:wazzifni_admin/core/constants/app_assets.dart';
import 'package:wazzifni_admin/core/constants/app_textStyle.dart';
import 'package:wazzifni_admin/core/constants/appcolors.dart';
import 'package:wazzifni_admin/core/utils/utils.dart';
import 'package:wazzifni_admin/core/widgets/custom_widgets/custom_textfield.dart';
import '../../../../core/common/models/company_model.dart';
import '../../../../core/common/models/enums.dart';
import '../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../../core/widgets/dialog/custom_dialog.dart';
import '../../data/repository/company_repository.dart';
import '../../data/use_case/approve_company_use_case.dart';
import '../../data/use_case/reject_company_use_case.dart';

class CompanyHeaderWidget extends StatefulWidget {
  const CompanyHeaderWidget({
    super.key,
    required this.company,
    required this.onChangeStatus,
    required this.onChangeIndex,
  });

  final Company company;
  final VoidCallback onChangeStatus;
  final Function(int) onChangeIndex;

  @override
  State<CompanyHeaderWidget> createState() => _CompanyHeaderWidgetState();
}

class _CompanyHeaderWidgetState extends State<CompanyHeaderWidget> {
  int _selectedIndex = 0;
  final List<String> _labels = [
    "jobs".tr(),
    "job_applications".tr(),
    "account_info".tr(),
  ];
  TextEditingController rejectController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            // Cover Image
            Stack(
              children: [
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppAssets.cover),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 10,
                  child: CustomButton(
                    width: 120,
                    height: 35,
                    isSecondaryGradient: true,
                    text:
                        StatusEnum.values
                            .firstWhere((e) => widget.company.status == e.value)
                            .name
                            .tr(),
                    onTap: () async {
                      final RenderBox button =
                          context.findRenderObject() as RenderBox;
                      final RenderBox overlay =
                          Overlay.of(context).context.findRenderObject()
                              as RenderBox;

                      // Get the button’s global position
                      final Offset position = button.localToGlobal(
                        Offset.zero,
                        ancestor: overlay,
                      );
                      final Size buttonSize = button.size;

                      final selectedValue = await showMenu(
                        context: context,
                        position: RelativeRect.fromLTRB(
                          position.dx + 15, // X position (left)
                          position.dy +
                              buttonSize.height -
                              170, // Adjust Y position with a smaller offset
                          position.dx + buttonSize.width, // Right boundary
                          position.dy +
                              buttonSize.height +
                              100, // Bottom boundary (not really used)
                        ),
                        items:
                            StatusEnum.values
                                .map(
                                  (e) => PopupMenuItem(
                                    value: e.value,
                                    child: Text(
                                      e.name.tr(),
                                      style: AppText.fontSizeNormalTextStyle,
                                    ),
                                  ),
                                )
                                .toList(),
                      );
                      if (selectedValue != null) {
                        int currentStatus =
                            StatusEnum.values
                                .firstWhere(
                                  (e) => widget.company.status == e.value,
                                )
                                .value;
                        if (selectedValue == currentStatus) {
                          return;
                        }
                        if (selectedValue == 2) {
                          await ApproveCompanyUseCase(CompanyRepository())
                              .call(
                                params: ApproveCompanyParams(
                                  id: widget.company.id!,
                                ),
                              )
                              .then((value) {
                                widget.onChangeStatus();
                              });
                        } else if (selectedValue == 3) {
                          showCustomDialog(
                            context: context,
                            text: '',
                            isWithCancel: true,
                            child: SizedBox(
                              width: 350,
                              child: CustomTextField(
                                controller: rejectController,
                                keyboardType: TextInputType.text,
                                hintText: 'reject_hint'.tr(),
                                maxLines: 4,
                              ),
                            ),
                            onTapOK: () async {
                              if (rejectController.text.isNotEmpty) {
                                await RejectCompanyUseCase(CompanyRepository())
                                    .call(
                                      params: RejectCompanyParams(
                                        companyId: widget.company.id!,
                                        reasonRefuse:
                                            rejectController.text.trim(),
                                      ),
                                    )
                                    .then((value) {
                                      widget.onChangeStatus();
                                      context.pop();
                                    });
                              } else {
                                Utils.showToast(
                                  'please_fill_required_fields'.tr(),
                                );
                              }
                            },
                            onTapCancel: () {
                              context.pop();
                            },
                          );
                        } else {}
                      }
                    },
                  ),
                ),
              ],
            ),
            Gaps.vGap5,
          ],
        ),
        Positioned(
          top: 130,
          left: 0,
          right: 0,
          child: Container(
            height: 82,
            width: double.infinity,
            padding: PaddingInsets.bigPaddingAll,
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: AppColors.boxShadow2,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage: NetworkImage(
                            widget.company.profile!.url!,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.company.name ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppText.fontSizeMediumTextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.company.city?.name ?? '',
                              style: AppText.fontSizeSmallTextStyle.copyWith(
                                color: AppColors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                  child: ToggleButtons(
                    borderRadius: BorderRadius.circular(10),
                    selectedBorderColor: AppColors.darkPrimaryColor,
                    selectedColor: Colors.white,
                    fillColor: AppColors.primaryColor,
                    color: Colors.black,
                    isSelected: List.generate(
                      _labels.length,
                      (index) => index == _selectedIndex,
                    ),
                    onPressed: (int index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                      widget.onChangeIndex(index);
                    },
                    children:
                        _labels
                            .map(
                              (label) => Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                child: Text(label),
                              ),
                            )
                            .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
