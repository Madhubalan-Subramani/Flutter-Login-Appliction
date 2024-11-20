import 'package:flutter/material.dart';
import 'package:login/src/features/authentication/controllers/auth_service.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        actions: [
          IconButton(
              onPressed: () {
                AuthService().logout();
                Navigator.pushNamedAndRemoveUntil(
                    context, 'loginScreen', (route) => false);
                Get.snackbar('Logged out', 'User logout Successfully');
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: const Center(
        child: Text("Welcome to home Screen"),
      ),
    );
  }
}
