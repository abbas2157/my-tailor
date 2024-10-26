import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_tailor/app_strings/app_strings.dart';
import 'package:my_tailor/constants/contantColor.dart';
import 'package:my_tailor/constants/customButton.dart';
import 'package:my_tailor/controllers/authController/loginController.dart';
import 'package:my_tailor/view/forgetPassword_screen.dart';
import 'package:my_tailor/view/signUp_screen.dart';

class LoginScreen extends StatelessWidget {
  // Instantiate the AuthController
  final Logincontroller authController = Get.put(Logincontroller());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                    AppStrings.logintoyour,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    AppStrings.welcome,
                    style: TextStyle(fontSize: 15, color: Colors.black54),
                  ),
                ),
                SizedBox(height: height * 0.03),

                // Email Field
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    AppStrings.emailAddress,
                    style: TextStyle(fontSize: 15, color: Colors.black54),
                  ),
                ),
                SizedBox(height: height * 0.005),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: emailController, // Using controller
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      } else if (!GetUtils.isEmail(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    decoration: textFormFieldDecoration(),
                  ),
                ),
                SizedBox(height: height * 0.02),

                // Password Field
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    AppStrings.password,
                    style: TextStyle(fontSize: 15, color: Colors.black54),
                  ),
                ),
                SizedBox(height: height * 0.005),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: passwordController, // Using controller
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                    decoration: textFormFieldDecoration(),
                  ),
                ),

                // Remember Me and Forgot Password
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Obx(() => Checkbox(
                                value: authController.isLoading
                                    .value, // Bind loading state to checkbox
                                onChanged: (bool? value) {
                                  authController.isLoading(value!);
                                },
                                activeColor: Constantcolor.blueColor,
                                checkColor: Colors.white,
                              )),
                          const Text(AppStrings.remember),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => ForgetpasswordScreen());
                        },
                        child: const Text(AppStrings.forget),
                      ),
                    ],
                  ),
                ),

                // Login Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Obx(() => MyCustomButton(
                        size: Size.fromWidth(width),
                        color: Constantcolor.blueColor,
                        onPressed: authController.isLoading.value
                            ? null
                            : () {
                                authController.login(
                                    email: emailController.text,
                                    password: passwordController.text);
                              },
                        child: authController.isLoading.value
                            ? const CircularProgressIndicator(
                                color: Colors.white)
                            : const Text(
                                AppStrings.login,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                      )),
                ),
                SizedBox(height: height * 0.02),

                // Signup option
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90),
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
        ),
      ),
    );
  }

  InputDecoration textFormFieldDecoration() {
    return InputDecoration(
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
