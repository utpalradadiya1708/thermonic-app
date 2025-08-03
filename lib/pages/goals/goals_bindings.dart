import 'package:get/get.dart';

import 'goals_controller.dart';

class GoalsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<GoalsController>(GoalsController());
  }
}
