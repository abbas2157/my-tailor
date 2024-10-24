import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignupAuthController extends GetxController {
  var isLoading = false.obs; // To track loading state
  var errorMessage = ''.obs; // To store error messages from the API

  // Function to create an account (register)
  Future<void> createAccount(String email, String password, String name) async {
    isLoading.value = true; // Start loading

    final url = 'http://tailor.alraiclothes.pk/api/account/create';
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'email': email,
      'password': password,
      'name': name,
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        if (responseData['success'] == true) {
          Get.snackbar('Success', 'Account created successfully!');
          // You can also navigate to the next screen
        } else {
          errorMessage.value =
              responseData['message'] ?? 'Unknown error occurred.';
          Get.snackbar('Error', errorMessage.value);
          // Optionally, show specific validation errors
          if (responseData['data'] != null &&
              responseData['data']['email'] != null) {
            errorMessage.value = responseData['data']['email'][0];
            Get.snackbar('Error', errorMessage.value);
          }
        }
      } else {
        Get.snackbar('Error', 'Failed to create account. Please try again.');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      isLoading.value = false; // Stop loading
    }
  }
}
