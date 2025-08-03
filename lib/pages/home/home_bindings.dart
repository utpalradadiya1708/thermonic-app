import 'package:get/get.dart';

import '../../core/common/controller/common_tab_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<NotificationCounterController>(
    //   () => NotificationCounterController(),
    // );
    // Get.create<HomeController>(() => HomeController());
    // Get.put<HomeController>(HomeController());
    Get.lazyPut(() => CommonTabController());
  }
}
