import 'package:get/get.dart';

import 'otp_controller.dart';

class OtpBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<OtpController>(OtpController());
  }
}
