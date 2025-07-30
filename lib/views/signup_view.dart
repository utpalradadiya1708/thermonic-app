import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(decoration: const InputDecoration(labelText: 'Email')),
            TextField(decoration: const InputDecoration(labelText: 'Name')),
            TextField(decoration: const InputDecoration(labelText: 'Password')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.back(),
              child: const Text("Sign Up"),
            ),
            TextButton(
              onPressed: () => Get.back(),
              child: const Text("Back to Login"),
            ),
          ],
        ),
      ),
    );
  }
}