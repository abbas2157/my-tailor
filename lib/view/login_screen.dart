import 'package:flutter/material.dart';
import 'package:my_tailor/constants/contantColor.dart';
import 'package:my_tailor/constants/customButton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Image.asset('assets/images/App Icon.png'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                'Login to your Account',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                'Welcome back,please enter your details',
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Email Address',
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                decoration: textFormFieldDecoration(),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Password',
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                decoration: textFormFieldDecoration(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                        activeColor: Constantcolor.blueColor,
                        checkColor: Colors.white,
                      ),
                      const Text('Remember me'),
                    ],
                  ),
                  const Row(
                    children: [Text("Forget Password?")],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: MyCustomButton(
                  size: Size.fromWidth(width),
                  color: Constantcolor.blueColor,
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )),
            ),
            SizedBox(
              height: height * 0.01,
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration textFormFieldDecoration() {
    return InputDecoration(
      // hintText: 'Email',
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Constantcolor.blColor),
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Constantcolor.blColor),
        borderRadius: BorderRadius.circular(8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Constantcolor.redColor),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Constantcolor.redColor),
        borderRadius: BorderRadius.circular(8),
      ),
      filled: true,
      fillColor: Constantcolor.whColor,
    );
  }
}
