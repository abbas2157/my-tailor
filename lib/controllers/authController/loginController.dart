import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_tailor/local-storage_services/local_storage_methods.dart';
import 'dart:convert';
import 'package:my_tailor/models/user_model.dart'; // Import UserModel
import 'package:my_tailor/view/screens/rootPage.dart'; // Import RootPage

class Logincontroller extends GetxController {
  var isLoading = false.obs;

  void login({required String email, required String password}) async {
    try {
      isLoading.value = true;
      var body = jsonEncode({"email": email, "password": password});
      var headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
      http.Response response = await http.post(
        Uri.parse("http://tailor.alraiclothes.pk/api/account/login"),
        body: body,
        headers: headers,
      );

      // Decode response body
      var responseData = jsonDecode(response.body);
      print("Login response: ${responseData}");

      // Check if login was successful
      if (response.statusCode == 200 && responseData['success'] == true) {
        // Parse user data if necessary
        UserModel userModel = UserModel.fromJson(responseData['data']['user']);
        LocalStorageMethods.instance.writeUserID(userModel.userId.toString());
        LocalStorageMethods.instance.writeUserEmail(userModel.email.toString());
        LocalStorageMethods.instance
            .writeUserApiToken(userModel.token.toString());
        LocalStorageMethods.instance.writeUserName(userModel.name.toString());

        // Navigate to RootPage
        Get.offAll(() => RootPage());
      } else {
        // Handle unsuccessful login
        Get.snackbar("Error", responseData['message'] ?? "Login failed");
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print("Error: ${e.toString()}");
      Get.snackbar("Error", "An error occurred during login.");
    }
  }
}
