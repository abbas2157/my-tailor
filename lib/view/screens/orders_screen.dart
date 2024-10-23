import 'package:flutter/material.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: SizedBox(
                height: height * 0.2,
                width: width * 0.5,
                child: Image.asset("assets/images/noOrderYet.png")),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 80),
            child: Text(
              'Welcome to My Tailor!',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
          ),
          const Text(
            'No client is added yet',
            style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 15,
                color: Colors.black54),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
