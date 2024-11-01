import 'package:flutter/material.dart';
import 'package:my_tailor/constants/contantColor.dart';
import 'package:my_tailor/local-storage_services/local_storage_methods.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Card(
              color: Colors.white,
              shadowColor: Colors.grey,
              child: ListTile(
                title: Text(
                  'Name',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                leading: Icon(Icons.person_2_outlined),
                trailing: Text(
                  LocalStorageMethods.instance.getUserName() ?? "user_name",
                  style: TextStyle(
                      color: Constantcolor.blueColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Card(
              color: Colors.white,
              shadowColor: Colors.grey,
              child: ListTile(
                title: Text(
                  'Email',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                leading: Icon(Icons.email_outlined),
                trailing: Text(
                  LocalStorageMethods.instance.getUserEmail() ?? "user_email",
                  style: TextStyle(
                      color: Constantcolor.blueColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
