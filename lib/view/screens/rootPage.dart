import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_tailor/constants/contantColor.dart';
import 'package:my_tailor/local-storage_services/local_storage_methods.dart';
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
        automaticallyImplyLeading: false, // Prevents default back icon
        title: Text(LocalStorageMethods.instance.getUserName() ?? "user_name"),
        actions: const [
          Icon(Icons.language),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(Icons.notifications),
          ),
        ],
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_outlined,
                color: Colors.black),
            onPressed: () async {
              await Prefs.clear();
              Get.offAllNamed('/loginScreen');
            }),
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
