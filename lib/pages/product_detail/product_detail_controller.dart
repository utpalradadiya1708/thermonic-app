import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  // Reactive variables
  var selectedDisc = 'REGULAR DISC'.obs;
  var selectedLength = '5MM'.obs;
  var quantity = 1.obs;
  var price = 1.00.obs;

  List<String> discOptions = [
    'REGULAR DISC',
    'SPRING LOADED DISC',
    'TRANSMITTER',
  ];

  List<String> lengthOptions = [
    '5MM',
    '10MM',
    '15MM',
    '20MM',
    '25MM',
    '30MM',
    '35MM',
  ];

  void incrementQty() {
    quantity.value++;
  }

  void decrementQty() {
    if (quantity > 1) {
      quantity.value--;
    }
  }

  double get totalPrice => quantity.value * price.value;
}
