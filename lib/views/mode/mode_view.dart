
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/mode_controller.dart';

class ModeView extends GetView<ModeController> {
  const ModeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mode")),
      body: const Center(child: Text("Mode Screen")),
    );
  }
}
