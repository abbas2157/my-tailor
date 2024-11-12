import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_tailor/app_strings/app_strings.dart';
import 'package:my_tailor/constants/contantColor.dart';
import 'package:my_tailor/constants/customButton.dart';
import 'package:my_tailor/models/user_model.dart';
import 'package:my_tailor/view/otpVerification.dart';
import 'package:my_tailor/view/login_screen.dart';
import 'package:my_tailor/view/signUp_screen.dart';

class ForgetpasswordScreen extends StatefulWidget {
  const ForgetpasswordScreen({super.key});

  @override
  State<ForgetpasswordScreen> createState() => _ForgetpasswordScreenState();
}

class _ForgetpasswordScreenState extends State<ForgetpasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset('assets/images/App Icon.png'),
            ),
            const Center(
              child: Text(
                AppStrings.forget,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Center(
                child: Text(
                  AppStrings.enterEmailtogetcode,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                AppStrings.emailAddress,
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),
            ),
            SizedBox(
              height: height * 0.005,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                decoration: textFormFieldDecoration(),
              ),
            ),
            SizedBox(
              height: height * 0.005,
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(

                  //         ///need some changes
                  //         ///
                  //         builder: (context) => Otpverification(
                  //               userModel: UserModel(),
                  //               isForSignup: true,
                  //             )));
                },
                child: MyCustomButton (
                  size: Size.fromWidth(width),
                  color: Constantcolor.blueColor,
                  child: const Text(
                    AppStrings.submit,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )
                ),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                },
                child: RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                      text: AppStrings.already,
                      style: TextStyle(color: Colors.black)),
                  TextSpan(
                      text: AppStrings.login,
                      style: TextStyle(color: Constantcolor.blueColor))
                ])),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Get.to(() => const SignUpScreen());
                },
                child: RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                      text: AppStrings.donthave,
                      style: TextStyle(color: Colors.black)),
                  TextSpan(
                      text: AppStrings.signup,
                      style: TextStyle(color: Constantcolor.blueColor))
                ])),
              ),
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
        borderSide: const BorderSide(color: Constantcolor.blueColor),
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
