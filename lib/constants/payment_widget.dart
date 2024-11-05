import 'package:flutter/material.dart';

class PaymentWidget extends StatelessWidget {
  final String paymentName;
  final TextEditingController controller = TextEditingController();

  PaymentWidget({Key? key, required this.paymentName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center, // Center items vertically
      children: [
        // Payment Name
        Text(
          paymentName,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        // TextFormField for entering payment amount
        SizedBox(
          width: 120,
          height: 30, // Consistent height for alignment
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  vertical: 10, horizontal: 10), // Adjust padding for alignment
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
