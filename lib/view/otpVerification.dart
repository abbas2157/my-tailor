import 'package:flutter/material.dart';
import 'package:my_tailor/app_strings/app_strings.dart';
import 'package:my_tailor/constants/contantColor.dart';
import 'package:my_tailor/constants/customButton.dart';
import 'package:my_tailor/view/set_new_password.dart';

class Otpverification extends StatefulWidget {
  const Otpverification({super.key});

  @override
  State<Otpverification> createState() => _OtpverificationState();
}

class _OtpverificationState extends State<Otpverification> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;

    final height = MediaQuery.sizeOf(context).height * 1;

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
            SizedBox(
              height: height * 0.01,
            ),
            RichText(
                text: const TextSpan(children: [
              TextSpan(
                text: AppStrings.enterOtp,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                ),
              ),
              TextSpan(
                text: AppStrings.yourEmail,
                style: TextStyle(
                  fontSize: 15,
                  color: Constantcolor.blueColor,
                ),
              ),
            ])),
            SizedBox(
              height: height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: Expanded(
                child: Row(
                  children: [
                    otpInput(),
                    otpInput(),
                    otpInput(),
                    otpInput(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            RichText(
                text: const TextSpan(children: [
              TextSpan(
                text: AppStrings.dontreceive,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                ),
              ),
              TextSpan(
                text: AppStrings.reSend,
                style: TextStyle(
                  fontSize: 15,
                  color: Constantcolor.blueColor,
                ),
              ),
            ])),
            SizedBox(
              height: height * 0.04,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SetNewPassword()));
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
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget otpInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: TextField(
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
