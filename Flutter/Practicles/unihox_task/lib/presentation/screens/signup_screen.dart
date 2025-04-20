import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import 'login_screen.dart';

class SignupScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/signup_bg.jpg', fit: BoxFit.cover),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 32),

                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(labelText: "Name"),
                          validator:
                              (value) =>
                                  value != null && value.isNotEmpty
                                      ? null
                                      : "Enter your name",
                        ),

                        SizedBox(height: 16),

                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(labelText: "Email"),
                          validator:
                              (value) =>
                                  value != null && value.contains('@')
                                      ? null
                                      : "Enter a valid email",
                        ),

                        SizedBox(height: 16),

                        TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(labelText: "Password"),
                          obscureText: true,
                          validator:
                              (value) =>
                                  value != null && value.length >= 6
                                      ? null
                                      : "Password must be at least 6 characters",
                        ),

                        SizedBox(height: 24),

                        Obx(
                          () =>
                              controller.isLoading.value
                                  ? CircularProgressIndicator()
                                  : ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        controller.login(
                                          emailController.text.trim(),
                                          passwordController.text.trim(),
                                        );
                                      }
                                    },
                                    child: Text("Sign Up"),
                                  ),
                        ),

                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text("Already have an account? Login"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
