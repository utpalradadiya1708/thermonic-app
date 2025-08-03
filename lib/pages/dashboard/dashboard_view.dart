import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../core/common/constants/image_constants.dart';
import '../../core/common/widget/common_background.dart';
import '../../core/common/widget/custom_bottom_bar.dart';
import '../home/home_view.dart';
import '../setting/setting_view.dart';
import 'dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          return;
        }
        if (!controller.getPopScreenOrNot() && controller.currentIndex.value != 0) {
          controller.changePage(0);
        } else {
          if (Platform.isAndroid) {
            SystemNavigator.pop();
          } else {
            exit(0);
          }
        }
      },
      child: CommonBackground(
       /* bottomNavigationBar: Obx(() {
          return CustomBottomBar(
            currentIndex: controller.currentIndex.value,
            onTap: (i) {
              controller.changePage(i);
            },
            items: getTabs(),
          );
        }),*/
        child: SafeArea(top: true, bottom: true, child: Obx(() => _getCurrentPage(controller.currentIndex.value))),
      ),
    );
  }

  Widget _getCurrentPage(int index) {
    switch (index) {
      case 0:
        return HomeView();
      case 1:
        // return PackagesView();
      case 2:
        return SettingView();
      default:
        return const SizedBox();
    }
  }

  static List<CustomBottomBarItem> getTabs() {
    return [
      CustomBottomBarItem(
        icon: SvgPicture.asset(ImageConstants.icHomeInActive),
        activeIcon: SvgPicture.asset(ImageConstants.icHomeActive),
        title: Text('lblHome'.tr),
      ),
      CustomBottomBarItem(
        icon: SvgPicture.asset(ImageConstants.icPackagesInActive),
        activeIcon: SvgPicture.asset(ImageConstants.icPackagesActive),
        title: Text('lblPackages'.tr),
      ),
      CustomBottomBarItem(
        icon: SvgPicture.asset(ImageConstants.icSettingInActive),
        activeIcon: SvgPicture.asset(ImageConstants.icSettingActive),
        title: Text('lblSetting'.tr),
      ),
    ];
  }
}
