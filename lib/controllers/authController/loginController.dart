import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthController extends GetxController {
  var isLoading = false.obs;

  // TextEditingControllers for email and password
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Form key to validate email and password
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  // Login function
  Future<void> login() async {
    if (!loginFormKey.currentState!.validate()) {
      return;
    }

    isLoading(true);

    const String loginUrl = 'http://tailor.alraiclothes.pk/api/account/login';

    try {
      var response = await http.post(
        Uri.parse(loginUrl),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'email': emailController.text,
          'password': passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        if (data['success']) {
          // Handle successful login
          Get.snackbar("Login Success", data['message']);
          // You can navigate to the home/root screen
          Get.offAllNamed('/rootPage'); // Update with your route
        } else {
          Get.snackbar("Login Failed", data['message']);
        }
      } else {
        Get.snackbar("Error", "Login failed. Please try again.");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred. Please try again.");
    } finally {
      isLoading(false);
    }
  }
}
