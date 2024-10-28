import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_tailor/constants/contantColor.dart';
import 'package:my_tailor/local-storage_services/local_storage_methods.dart';
import 'package:my_tailor/routes/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      String? userId = LocalStorageMethods.instance.getUserId();
      if (userId != null && userId.isNotEmpty) {
        Get.offAllNamed(RouteNames.rootPage);
      } else {
        Get.offAllNamed(RouteNames.loginScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Image.asset('assets/images/App Icon.png'),
          ),
          RichText(
              text: const TextSpan(children: [
            TextSpan(
                text: 'My',
                style: TextStyle(color: Constantcolor.blColor, fontSize: 30)),
            TextSpan(
                text: "Tailor.",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30))
          ]))
        ],
      ),
    );
  }
}
