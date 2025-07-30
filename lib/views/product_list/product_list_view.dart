
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/product_list_controller.dart';
import '../product_details/product_details_view.dart';

class Product_listView extends GetView<Product_listController> {
  const Product_listView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Show All Products"),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Buy Now'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildProductList("All"),
            _buildProductList("Buy Now"),
          ],
        ),
      ),
    );
  }

  Widget _buildProductList(String type) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text("\$type Product \$index"),
          trailing: ElevatedButton(
            onPressed: () => Get.toNamed('/product_details'),
            child: const Text("View"),
          ),
        );
      },
    );
  }
}
