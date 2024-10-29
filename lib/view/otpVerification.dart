import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_tailor/app_strings/app_strings.dart';
import 'package:my_tailor/constants/contantColor.dart';
import 'package:my_tailor/constants/customButton.dart';
import 'package:my_tailor/local-storage_services/local_storage_methods.dart';
import 'package:my_tailor/models/user_model.dart';
import 'package:my_tailor/routes/routes_name.dart';
import 'package:my_tailor/utils/app_utils.dart';
import 'package:my_tailor/view/set_new_password.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({
    super.key,
    required this.userModel,
    required this.isForSignup,
  });

  final UserModel userModel;
  final bool isForSignup;

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  // Define the controllers
  final firstController = TextEditingController();
  final secondController = TextEditingController();
  final thirdController = TextEditingController();
  final fourthController = TextEditingController();

  // List of controllers to manage focus and input length
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers = [
      firstController,
      secondController,
      thirdController,
      fourthController
    ];
    focusNodes = List.generate(4, (index) => FocusNode());
  }

  @override
  void dispose() {
    // Dispose controllers and focus nodes
    controllers.forEach((controller) => controller.dispose());
    focusNodes.forEach((node) => node.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Image.asset('assets/images/App Icon.png'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 63),
              child: Text(
                AppStrings.otp,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ),
            SizedBox(height: height * 0.01),
            RichText(
              text: const TextSpan(children: [
                TextSpan(
                  text: AppStrings.enterOtp,
                  style: TextStyle(fontSize: 15, color: Colors.black54),
                ),
                TextSpan(
                  text: AppStrings.yourEmail,
                  style:
                      TextStyle(fontSize: 15, color: Constantcolor.blueColor),
                ),
              ]),
            ),
            SizedBox(height: height * 0.03),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  otpInput(firstController, 0),
                  otpInput(secondController, 1),
                  otpInput(thirdController, 2),
                  otpInput(fourthController, 3),
                ],
              ),
            ),
            SizedBox(height: height * 0.03),
            RichText(
              text: const TextSpan(children: [
                TextSpan(
                  text: AppStrings.dontreceive,
                  style: TextStyle(fontSize: 15, color: Colors.black54),
                ),
                TextSpan(
                  text: AppStrings.reSend,
                  style:
                      TextStyle(fontSize: 15, color: Constantcolor.blueColor),
                ),
              ]),
            ),
            SizedBox(height: height * 0.04),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: InkWell(
                onTap: widget.isForSignup
                    ? () {
                        String userEnteredOtp = controllers
                            .map((controller) => controller.text)
                            .join();
                        if (widget.userModel.emailVerificationCode.toString() ==
                            userEnteredOtp) {
                          // Handle successful OTP
                          // save user's data to local.
                          // navigate to home
                          LocalStorageMethods.instance
                              .writeUserID(widget.userModel.userId.toString());
                          LocalStorageMethods.instance.writeUserApiToken(
                              widget.userModel.token.toString());
                          LocalStorageMethods.instance
                              .writeUserName(widget.userModel.name.toString());
                          Get.offAllNamed(RouteNames.rootPage);
                        } else {
                          AppUtils.showSnackBar("Invalid OTP");
                        }
                      }
                    : () {
                        // Navigate to Set New Password screen
                      },
                child: MyCustomButton(
                  size: Size.fromWidth(width),
                  color: Constantcolor.blueColor,
                  child: const Text(
                    AppStrings.submit,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget otpInput(TextEditingController controller, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: TextField(
            controller: controller,
            focusNode: focusNodes[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly, // Only allows numbers
              LengthLimitingTextInputFormatter(1), // Limits input length to 1
            ],
            decoration: const InputDecoration(
              counterText: '', // Hide counter
              border: InputBorder.none,
            ),
            onChanged: (value) {
              // Move to the next field if input is made, or previous field if backspace
              if (value.isNotEmpty && index < controllers.length - 1) {
                FocusScope.of(context).requestFocus(focusNodes[index + 1]);
              } else if (value.isEmpty && index > 0) {
                FocusScope.of(context).requestFocus(focusNodes[index - 1]);
              }
            },
            onSubmitted: (_) {
              if (index < controllers.length - 1) {
                FocusScope.of(context).requestFocus(focusNodes[index + 1]);
              }
            },
          ),
        ),
      ),
    );
  }
}
