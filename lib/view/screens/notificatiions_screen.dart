import 'package:flutter/material.dart';

class NotificatiionsScreen extends StatefulWidget {
  const NotificatiionsScreen({super.key});

  @override
  State<NotificatiionsScreen> createState() => _NotificatiionsScreenState();
}

class _NotificatiionsScreenState extends State<NotificatiionsScreen> {
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
              padding: const EdgeInsets.symmetric(horizontal: 150),
              child: Image.asset('assets/images/notifications.png'),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "No Alerts",
            )
          ],
        ));
  }
}
