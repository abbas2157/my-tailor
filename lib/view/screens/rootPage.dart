import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_tailor/constants/contantColor.dart';
import 'package:my_tailor/local-storage_services/shared_preferences.dart';
import 'package:my_tailor/view/screens/addFromGallery_screen.dart';
import 'package:my_tailor/view/screens/addNewClient_screen.dart';
import 'package:my_tailor/view/screens/orders_screen.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _bottomNavIndex = 0;

  List<Widget> _widgetOptions() {
    return [
      const OrdersScreen(),
      const AddfromgalleryScreen(),
    ];
  }

  List<IconData> iconList = [
    Icons.edit_document,
    Icons.camera_alt_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true, // Prevents default back icon
        title: Text('MyTailor'),
        // Text(LocalStorageMethods.instance.getUserName() ?? "user_name"),
        actions: [
          InkWell(
              onTap: () {
                Get.toNamed('/language');
              },
              child: Icon(Icons.language)),
          InkWell(
            onTap: () {
              Get.toNamed('/notification');
            },
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Icon(Icons.notifications),
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        // Attach the Drawer widget here
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'MyTailor',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
                leading: Icon(Icons.logout_outlined),
                title: Text('Logout'),
                onTap: () async {
                  await Prefs.clear();
                  Get.offAllNamed('/loginScreen');
                } // Close the drawer

                ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Get.toNamed('/profileScreen');
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _bottomNavIndex,
        children: _widgetOptions(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddnewclientScreen(),
            ),
          );
        },
        backgroundColor: Constantcolor.blueColor,
        child: const Icon(
          Icons.add,
          color: Constantcolor.whColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _bottomNavIndex,
        splashColor: Constantcolor.blueColor,
        activeColor: Constantcolor.blueColor,
        inactiveColor: Constantcolor.blColor,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
      ),
    );
  }
}
