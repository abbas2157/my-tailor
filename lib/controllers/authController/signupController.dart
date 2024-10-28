import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_tailor/models/user_model.dart';
import 'package:my_tailor/view/otpVerification.dart';

class SignupAuthController extends GetxController {
  var isLoading = false.obs; // To track loading state
  var errorMessage = ''.obs; // To store error messages from the API

  // Function to create an account (register)
  Future<void> createAccount(String email, String password, String name) async {
    try {
      isLoading.value = true; // Start loading

      final url = 'http://tailor.alraiclothes.pk/api/account/create';
      final headers = {'Content-Type': 'application/json'};
      final body = jsonEncode({
        'email': email,
        'password': password,
        'name': name,
      });
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );
      isLoading.value = false; // Start loading

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        if (responseData['success'] == true) {
          UserModel _userModel = UserModel.fromJson(responseData['data']);
          Get.to(() => Otpverification(
                userModel: _userModel,
                isForSignup: true,
              ));
        }
      }
    } catch (e) {
      isLoading.value = false; // Start loading
      debugPrint("exception during signup $e");
      Get.snackbar('Error', e.toString());
    }
  }
}
