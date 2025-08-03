import 'package:get/get.dart';

class CheckOutController extends GetxController {
  // Reactive cart items
  var cartItems = <Map<String, dynamic>>[].obs;

  // Computed total price including quantity
  int get totalPrice => cartItems.fold(0, (int sum, item) {
    final price = item['price'] as int;
    final qty = item['quantity'] ?? 1;
    return sum + (price * qty).toInt(); // Force the result to int
  });


  @override
  void onInit() {
    super.onInit();
    loadCartItems(); // Load mock data
  }

  void loadCartItems() {
    cartItems.addAll([
      {'name': 'Product 1', 'price': 250, 'quantity': 1},
      {'name': 'Product 2', 'price': 400, 'quantity': 1},
      {'name': 'Product 3', 'price': 150, 'quantity': 1},
    ]);
  }

  void increaseQty(int index) {
    cartItems[index]['quantity']++;
    cartItems.refresh(); // Required to notify listeners
  }

  void decreaseQty(int index) {
    if (cartItems[index]['quantity'] > 1) {
      cartItems[index]['quantity']--;
      cartItems.refresh();
    }
  }

  void removeItem(int index) {
    cartItems.removeAt(index);
  }

  void clearCart() {
    cartItems.clear();
  }
}
