import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:my_tailor/services/network_manager/network_manager.dart';

class Logincontroller extends GetxController {
  var isLoading = false.obs;

  void login({required String email, required String password}) async {
    try {
      isLoading.value = true;
      var data = await NetworkManager().post("account/login");
      print(data);
      if (data['success'] == true) {
        print("login success");
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }
}
