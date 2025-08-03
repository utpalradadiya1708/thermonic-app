import 'package:get/get.dart';

import '../../core/common/controller/common_tab_controller.dart';
import 'setting_controller.dart';

class SettingBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<SettingController>(SettingController());
    Get.lazyPut(() => CommonTabController());
  }
}
