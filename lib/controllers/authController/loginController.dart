import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
          Uri.parse(
            "http://tailor.alraiclothes.pk/api/account/login",
          ),
          body: body,
          headers: headers);
      print("this is the response of login ${response.body}");
      print("this is the status code of login ${response.statusCode}");

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }
}
