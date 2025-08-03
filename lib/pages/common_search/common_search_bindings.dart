import 'package:get/get.dart';

import 'common_search_controller.dart';

class CommonSearchBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<CommonSearchController>(CommonSearchController());
  }
}
