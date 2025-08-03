import 'package:get/get.dart';
import 'package:thermonic/pages/profile_setup/profile_setup_controller.dart';

class ProfileSetupBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileSetupController());
    // TODO: implement dependencies
  }
}
