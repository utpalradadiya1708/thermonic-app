
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/product_details_controller.dart';

class Product_detailsView extends GetView<Product_detailsController> {
  const Product_detailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text("Product Name", style: TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            const RadioListTile(value: 1, groupValue: 1, onChanged: null, title: Text("Option 1")),
            const RadioListTile(value: 2, groupValue: 1, onChanged: null, title: Text("Option 2")),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.toNamed('/cart'),
              child: const Text("Checkout"),
            ),
          ],
        ),
      ),
    );
  }
}
