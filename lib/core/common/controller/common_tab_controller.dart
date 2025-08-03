import 'package:get/get.dart';

class CommonTabController extends GetxController {
  var selectedIndex = 0.obs;

  void selectIndex(int index) {
    selectedIndex.value = index;
  }

  void setInitialIndex(int index) {
    if (index >= 0) {
      selectedIndex.value = index;
    }
  }
}
