import 'package:get/get.dart';

import 'course_package_list_controller.dart';

class CoursePackageListBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<CoursePackageListController>(CoursePackageListController());
  }
}
