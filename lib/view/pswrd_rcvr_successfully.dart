import 'package:flutter/material.dart';
import 'package:my_tailor/app_strings/app_strings.dart';
import 'package:my_tailor/constants/contantColor.dart';
import 'package:my_tailor/constants/customButton.dart';
import 'package:my_tailor/view/login_screen.dart';

class PswrdRcvrSuccessfully extends StatefulWidget {
  const PswrdRcvrSuccessfully({super.key});

  @override
  State<PswrdRcvrSuccessfully> createState() => _PswrdRcvrSuccessfullyState();
}

class _PswrdRcvrSuccessfullyState extends State<PswrdRcvrSuccessfully> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 90),
            child: Container(
                height: height * 0.3,
                width: width * 0.5,
                child: Image.asset('assets/images/tick.png')),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 63),
            child: Text(
              AppStrings.passwordRvrSuccessfully,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 47),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: AppStrings.returntoLoginScreen,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: MyCustomButton(
                  size: Size.fromWidth(width),
                  color: Constantcolor.blueColor,
                  child: const Text(
                    AppStrings.returnTologin,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
