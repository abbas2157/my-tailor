import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.3, // 30% of screen height
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.blue, // Blue border color
          width: 1.0, // Border thickness
        ),
        borderRadius: BorderRadius.circular(8.0), // Optional rounded corners
      ),
      padding: EdgeInsets.all(16.0), // Padding inside the container
      alignment: Alignment.topLeft,
      child: TextFormField(
        controller: textController,
        decoration: InputDecoration(
          hintText: 'Enter your text here...',
          border: InputBorder.none, // Remove the default underline
        ),
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        textAlign: TextAlign.left, // Align text to the start (left-aligned)
      ),
    );
  }
}
