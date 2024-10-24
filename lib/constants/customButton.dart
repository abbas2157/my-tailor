import 'package:flutter/material.dart';

class MyCustomButton extends StatelessWidget {
  const MyCustomButton({
    super.key,
    required this.size,
    required this.child,
    required this.color,
    this.onPressed, // Optional onPressed callback
  });

  final Size size;
  final Color color;
  final Widget child;
  final VoidCallback? onPressed; // Nullable to maintain compatibility

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: GestureDetector(
        onTap: onPressed, // Add interactivity when onPressed is provided
        child: Container(
          height: height * 0.05,
          width: width * .95,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(child: child),
        ),
      ),
    );
  }
}
