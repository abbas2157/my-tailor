import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_tailor/constants/contantColor.dart';
import 'package:my_tailor/view/login_screen.dart';

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
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
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
