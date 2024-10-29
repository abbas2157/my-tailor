import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_tailor/app_strings/app_strings.dart';
import 'package:my_tailor/constants/contantColor.dart';
import 'package:my_tailor/constants/customButton.dart';
import 'package:my_tailor/controllers/authController/signupController.dart';
import 'package:my_tailor/view/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignupAuthController signupAuthController =
      Get.put(SignupAuthController()); // Inject SignupAuthController
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  bool isChecked = false;

  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // Add form key for validation

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey, // Add form key to the form
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Container(
                        height: height * 0.15,
                        width: width,
                        child: Image.asset('assets/images/App Icon.png')),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 63),
                    child: Text(
                      AppStrings.creat,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      AppStrings.signUpnow,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                          letterSpacing: -0.5),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      AppStrings.fullName,
                      style: TextStyle(fontSize: 15, color: Colors.black54),
                    ),
                  ),
                  SizedBox(height: height * 0.005),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: nameController,
                      decoration: textFormFieldDecoration(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name is required';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: height * 0.01),
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
                      controller: emailController,
                      decoration: textFormFieldDecoration(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        } else if (!GetUtils.isEmail(value)) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: height * 0.01),
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
                      controller: passwordController,
                      obscureText: true,
                      decoration: textFormFieldDecoration(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      AppStrings.confirmPassword,
                      style: TextStyle(fontSize: 15, color: Colors.black54),
                    ),
                  ),
                  SizedBox(height: height * 0.001),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: confirmPasswordController,
                      obscureText: true,
                      decoration: textFormFieldDecoration(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Confirm password is required';
                        } else if (value != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
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
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: RichText(
                                text: const TextSpan(children: [
                                  TextSpan(
                                      text: AppStrings.iHaveRead,
                                      style: TextStyle(
                                          color: Constantcolor.blColor)),
                                  TextSpan(
                                      text: AppStrings.termservice,
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Constantcolor.blueColor)),
                                ]),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Obx(() {
                      return MyCustomButton(
                        size: Size.fromWidth(width),
                        color: Constantcolor.blueColor,
                        onPressed: () {
                          print(nameController.text.toString());
                          print(emailController.text.toString());
                          print(passwordController.text.toString());
                          print(confirmPasswordController.text.toString());
                          if (_formKey.currentState!.validate()) {
                            signupAuthController.createAccount(
                              email: emailController.text,
                              cPassword: confirmPasswordController.text,
                              password: passwordController.text,
                              name: nameController.text,
                            );
                          }
                        },
                        child: signupAuthController.isLoading.value
                            ? CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                AppStrings.getStarted,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      );
                    }),
                  ),
                  SizedBox(height: height * 0.02),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 90),
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
                  SizedBox(height: height * 0.06),
                ],
              ),
            ),
          ),
        ));
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
