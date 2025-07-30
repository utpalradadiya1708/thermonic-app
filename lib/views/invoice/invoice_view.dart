
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/invoice_controller.dart';

class InvoiceView extends GetView<InvoiceController> {
  const InvoiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Invoice")),
      body: const Center(child: Text("Invoice Screen")),
    );
  }
}
