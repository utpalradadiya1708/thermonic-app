
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/order_status_controller.dart';

class Order_statusView extends GetView<Order_statusController> {
  const Order_statusView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Order_status")),
      body: const Center(child: Text("Order_status Screen")),
    );
  }
}
