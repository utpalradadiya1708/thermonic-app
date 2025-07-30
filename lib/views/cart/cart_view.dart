
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cart")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const ListTile(
              title: Text("Product X"),
              trailing: Text("₹400"),
            ),
            const ListTile(
              title: Text("GST"),
              trailing: Text("₹400"),
            ),
            const Divider(),
            const ListTile(
              title: Text("Total"),
              trailing: Text("₹800"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.toNamed('/dashboard'),
              child: const Text("Checkout"),
            ),
          ],
        ),
      ),
    );
  }
}
