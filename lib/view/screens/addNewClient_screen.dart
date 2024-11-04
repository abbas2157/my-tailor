import 'package:flutter/material.dart';

class AddnewclientScreen extends StatefulWidget {
  const AddnewclientScreen({super.key});

  @override
  State<AddnewclientScreen> createState() => _AddnewclientScreenState();
}

class _AddnewclientScreenState extends State<AddnewclientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Image.asset('assets/images/App Icon.png'),
            ),
            SizedBox(
              height: 30,
            ),
            Text("soon things 'll be added")
          ],
        ));
  }
}
