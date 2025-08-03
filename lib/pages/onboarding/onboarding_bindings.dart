import 'package:get/get.dart';

import 'onboarding_controller.dart';

class OnBoardingBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(OnBoardingController());
    // TODO: implement dependencies
  }
}
