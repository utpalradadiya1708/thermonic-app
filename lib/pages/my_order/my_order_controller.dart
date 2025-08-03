import 'package:get/get.dart';

class MyOrdersController extends GetxController {
  var orders = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDummyOrders();
  }

  void loadDummyOrders() {
    orders.value = [
      {
        'orderId': 'ORD12345',
        'date': '02 Aug 2025',
        'total': 799,
        'status': 'Delivered',
      },
      {
        'orderId': 'ORD12346',
        'date': '30 July 2025',
        'total': 450,
        'status': 'Shipped',
      },
      {
        'orderId': 'ORD12347',
        'date': '28 July 2025',
        'total': 1200,
        'status': 'Processing',
      },
    ];
  }
}
