import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'signup_view.dart';
import 'dashboard_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(decoration: const InputDecoration(labelText: 'Email')),
            TextField(decoration: const InputDecoration(labelText: 'Password')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.to(const DashboardView()),
              child: const Text("Login"),
            ),
            TextButton(
              onPressed: () => Get.to(const SignupView()),
              child: const Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}