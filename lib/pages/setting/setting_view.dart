import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:thermonic/core/common/constants/image_constants.dart';
import 'package:thermonic/core/common/widget/common_appbar.dart';
import 'package:thermonic/core/common/widget/common_white_circle_with_center_icon.dart';
import 'package:thermonic/core/theme/app_theme.dart';
import 'package:thermonic/pages/profile_setup/profile_setup_controller.dart';
import 'package:thermonic/utils/widget_extensions.dart';

import '../../core/common/constants/app_constants.dart';
import '../../core/common/repository/local_data/local_data_source.dart';
import '../../core/common/widget/common_components.dart';
import '../../core/di/injector_container.dart';
import '../../core/routes/app_pages.dart';
import '../../core/theme/color_constants.dart';
import '../../localization/locate_controller.dart';
import '../../models/setting_item.dart';
import '../../utils/helper/session_manager.dart';
import 'setting_controller.dart';

class SettingView extends GetView<SettingController> {
  SettingView({super.key});

  final localDataSource = getIt<LocalDataSource>();
  final profileSetupController = ProfileSetupController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocaleController>(
      builder: (_) {
        return RefreshIndicator(
          onRefresh: () async {
            await profileSetupController.completeProfileSetup(isRefresh: true);
            await controller.refreshUser();
          },
          color: ColorConstants.secondaryColor,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonAppBar(text: 'lblSetting'.tr, icon: SizedBox.shrink(), showIcon: false),
              //  10.vBox,
               // _buildProfileView(),
                Obx(() {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: buildSections(), // ✅ Correct
                  );
                }),
                // ...buildSections(),
               // 30.vBox,
                //_buildAppDetailView(),
              ],
            ).paddingSymmetric(horizontal: 16),
          ),
        );
      },
    );
  }

  List<Widget> buildSections() {
    var sections = SettingSection.values;
    List<Widget> sectionWidgets = [];

    for (var section in sections) {
      var sectionOptions = controller.settings.where((option) => option.settingSection == section).toList();

      if (sectionOptions.isEmpty) {
        continue; // Skip empty sections
      }

      sectionWidgets.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start, // ✅ This ensures start alignment
          children: [
           // 16.vBox,
            Text(section.tr, style: AppThemeState().textStyleRegular(ColorConstants.blackColor, fontSize: 16)),
            8.vBox,
            ...List.generate(sectionOptions.length, (i) {
              return Column(
                children: [
                  SettingWidget(option: sectionOptions[i], onPressed: () {}),
                  i != sectionOptions.length - 1 ? 16.vBox : 4.vBox,
                ],
              );
            }),
          ],
        ),
      );
    }

    return sectionWidgets;
  }

  Widget _buildProfileView() {
    return Obx(() {
      final user = controller.user.value;
      final isGuest = controller.isGuest.value;
      return Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 2, color: ColorConstants.profileBorderColor),
            ),
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(35),
              child: isGuest
                  ? Image.asset(ImageConstants.isGuestUser, height: 48, width: 48)
                  : CommonComponents.getNetworkImageViewAPI((user?.user.profilePictureFullUrl), height: 48, width: 48),
            ),
          ),
          9.hBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isGuest ? 'guest'.tr : user?.user.name ?? 'lblDummyUser'.tr,
                style: AppThemeState().textStyleRegular(ColorConstants.whiteColor, fontSize: 16),
              ),
              Text(
                isGuest ? 'pleaseLoginToAccessAccount'.tr : '',
                style: AppThemeState().textStyleRegular(ColorConstants.greyColor, fontSize: 14),
              ),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: () async {
              if (!await SessionManager.requireLoginForFeature()) {
                return;
              } else {
                Get.toNamed(Routes.profileSetup, arguments: {ArgumentsConst.isFromEditProfile: true})?.then((value) async {
                  await controller.refreshUser();
                });
              }
            },
            child: CommonWhiteCircleWithCenterIcon(
              height: 48,
              width: 48,
              borderColor: ColorConstants.borderColor,
              borderRadius: 12,
              child: SvgPicture.asset(ImageConstants.icEditProfile, width: 16, height: 16).paddingAll(2),
            ),
          ),
        ],
      );
    });
  }

  Widget _buildAppDetailView() {
    return Column(
      children: [
        SvgPicture.asset(ImageConstants.icAppLogo, height: 48, width: 45),
        8.vBox,
        Obx(() => Text(controller.appVersion.value, style: AppThemeState().textStyleRegular(ColorConstants.whiteColor, fontSize: 14))),
        24.vBox,
      ],
    );
  }
}

class SettingWidget extends StatefulWidget {
  final SettingItem option;
  final Function(bool)? onToggle;
  final Function? onPressed;
  final bool showIcon;

  const SettingWidget({super.key, required this.option, this.onPressed, this.onToggle, this.showIcon = true});

  @override
  State<SettingWidget> createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  @override
  Widget build(BuildContext context) {
    final isDeleteAccount = widget.option.title?.contains('lblDeleteAccount') ?? false;

    return Container(
      // height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isDeleteAccount ? ColorConstants.redColor : ColorConstants.borderColor, width: 1),
        color: ColorConstants.primaryColor,
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CommonWhiteCircleWithCenterIcon(
            height: 35,
            width: 35,
            padding: EdgeInsets.all(7),
            boxDecoration: BoxDecoration(
              color: ColorConstants.settingBoxColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: ColorConstants.secondaryButtonTextColor.withValues(alpha: 0.06), width: 1),
            ),
            child: SvgPicture.asset(widget.option.image ?? ''),
            onTap: () {},
          ),
          10.hBox,
          Text(
            widget.option.title?.tr ?? '',
            style: AppThemeState().textStyleRegular(isDeleteAccount ? ColorConstants.redColor : ColorConstants.whiteColor, fontSize: 16),
          ),
          Spacer(),
          SvgPicture.asset(ImageConstants.icArrowCircle, matchTextDirection: true),
        ],
      ),
    ).onTap(widget.option.onTap);
  }
}
