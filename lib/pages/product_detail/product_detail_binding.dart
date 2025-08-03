import 'package:get/get.dart';
import 'package:thermonic/pages/product_detail/product_detail_controller.dart';

class ProductDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ProductDetailController>(ProductDetailController());
  }
}
