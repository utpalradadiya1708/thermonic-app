import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/common/constants/app_constants.dart';
import '../../core/routes/app_pages.dart';
import '../../utils/helper/session_manager.dart';
import '../home/home_bindings.dart';
import '../home/home_controller.dart';
import '../home/home_view.dart';
import '../setting/setting_bindings.dart';
import '../setting/setting_controller.dart';
import '../setting/setting_view.dart';

class DashboardController extends GetxController with GetSingleTickerProviderStateMixin {
  final currentIndex = 0.obs;
  late TabController? tabController;

  final pages = <String>[Routes.home, Routes.packages, Routes.settings];

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: pages.length);
    if (Get.arguments != null && Get.arguments[ArgumentsConst.selectTab] != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        changePage(Get.arguments[ArgumentsConst.selectTab]);
      });
    }
    super.onInit();
  }

  Future<void> changePage(int index) async {
    if (index != currentIndex.value) {
      if (index == 1 && !await SessionManager.requireLoginForFeature()) {
        return;
      }
      if (index == 0) {
        if (Get.isRegistered<HomeController>()) {
          Get.delete<HomeController>();
        }
        Get.put(HomeController());
      }
      if (index == 1) {
        // if (Get.isRegistered<MyPurchasesController>()) {
        //   Get.delete<MyPurchasesController>();
        // }
        // Get.put(MyPurchasesController());
      }
      if (index == 2) {
        if (Get.isRegistered<SettingController>()) {
          Get.delete<SettingController>();
        }
        Get.put(SettingController());
      }

      currentIndex.value = index;
    }
  }
  // void changePage(int index) {
  //   if (index != currentIndex.value) {
  //     currentIndex.value = index;
  //     // Get.offNamed(pages[index], id: 0);
  //   }
  // }

  bool getPopScreenOrNot() {
    return currentIndex.value == 0;
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == Routes.home) {
      return GetPageRoute(
        settings: settings,
        page: () => HomeView(),
        binding: HomeBinding(),
        transition: Transition.leftToRight,
        transitionDuration: Duration.zero,
      );
    } else if (settings.name == Routes.packages) {
      // return GetPageRoute(
      //   settings: settings,
      //   page: () => PackagesView(),
      //   binding: PackagesBindings(),
      //   transition: Transition.leftToRight,
      //   transitionDuration: Duration.zero,
      // );
    } else if (settings.name == Routes.settings) {
      return GetPageRoute(
        settings: settings,
        page: () => SettingView(),
        binding: SettingBindings(),
        transition: Transition.leftToRight,
        transitionDuration: Duration.zero,
      );
    }

    return null;
  }

  @override
  void onClose() {
    tabController!.dispose();
    super.onClose();
  }
}
