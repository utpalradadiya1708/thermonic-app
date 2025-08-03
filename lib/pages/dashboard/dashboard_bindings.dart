import 'package:get/get.dart';

import '../../core/common/controller/common_tab_controller.dart';
import '../home/home_controller.dart';
import '../setting/setting_controller.dart';
import 'dashboard_controller.dart';

class DashboardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CommonTabController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => SettingController());
    Get.put<DashboardController>(DashboardController());
  }
}
