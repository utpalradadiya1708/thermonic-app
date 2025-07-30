import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F2F9),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildField(
                    label: "Your Email",
                    hint: "e.g. user@example.com",
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) =>
                    val != null && val.isEmail ? null : "Enter valid email",
                  ),
                  const SizedBox(height: 16),
                  _buildField(
                    label: "Password",
                    hint: "Enter Password",
                    controller: controller.passwordController,
                    obscureText: true,
                    validator: (val) =>
                    val != null && val.length >= 6 ? null : "Min 6 characters",
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7D5260),
                      minimumSize: const Size.fromHeight(48),
                    ),
                    onPressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.loginUser();
                      }
                    },
                    child: const Text("Login"),
                  ),
                  TextButton(
                    onPressed: () => Get.toNamed('/signup'),
                    child: const Text("Don't have an account? Sign Up"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField({
    required String label,
    required String hint,
    required TextEditingController controller,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.white,
            border: _border(),
            enabledBorder: _border(),
            focusedBorder: _border(color: Colors.deepPurple),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _border({Color color = const Color(0xFFE0E0E0)}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(color: color),
    );
  }
}
