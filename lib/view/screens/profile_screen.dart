import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String userName = "Ali Hassan";
  final String userEmail = "hassan@example.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          userName,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.white, // Sets the color of the back button to white
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileRow(
              icon: Icons.person,
              label: 'Name',
              value: userName,
              onEdit: () {
                // Implement edit functionality here
              },
            ),
            SizedBox(height: 16.0),
            ProfileRow(
              icon: Icons.email,
              label: 'Email',
              value: userEmail,
              onEdit: () {
                // Implement edit functionality here
              },
            ),
            SizedBox(height: 16.0),
            ProfileRow(
              icon: Icons.lock,
              label: 'Old Password',
              value: '********',
              onEdit: () {
                // Implement edit functionality here
              },
            ),
            SizedBox(height: 16.0),
            ProfileRow(
              icon: Icons.lock_outline,
              label: 'New Password',
              value: '********',
              onEdit: () {
                // Implement edit functionality here
              },
            ),
            SizedBox(height: 30.0),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Implement cancel functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[400], // Cancel button color
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                    ),
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Implement save functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Save button color
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                    ),
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onEdit;

  const ProfileRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.blue,
          size: 30,
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.edit,
            color: Colors.blue,
          ),
          onPressed: onEdit,
        ),
      ],
    );
  }
}
