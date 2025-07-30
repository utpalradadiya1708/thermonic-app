
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(decoration: InputDecoration(labelText: 'Email')),
            const TextField(decoration: InputDecoration(labelText: 'Password')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.toNamed('/products'),
              child: const Text("Login"),
            ),
            TextButton(
              onPressed: () => Get.toNamed('/signup'),
              child: const Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
