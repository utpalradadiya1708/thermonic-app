import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void loginUser() {
    final email = emailController.text.trim();
    final password = passwordController.text;

    // Add your login logic here
    print("Email: $email, Password: $password");
    Get.toNamed('/products');
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
