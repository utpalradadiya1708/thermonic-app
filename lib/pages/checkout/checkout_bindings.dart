import 'package:get/get.dart';

import 'checkout_controller.dart';

class CheckOutBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<CheckOutController>(CheckOutController());
  }
}
