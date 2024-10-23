import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_tailor/constants/contantColor.dart';
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
      // const AddnewclientScreen(),
      const AddfromgalleryScreen(),
    ];
  }

  List<IconData> iconList = [
    Icons.edit_document,
    // Icons.add,
    Icons.camera_alt_outlined
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: RichText(
            text: const TextSpan(children: [
          TextSpan(
              text: 'My',
              style: TextStyle(color: Constantcolor.blColor, fontSize: 25)),
          TextSpan(
              text: 'Tailor.',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Constantcolor.blColor,
                  fontSize: 25))
        ])),
        actions: const [
          Icon(Icons.language),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(Icons.notifications),
          )
        ],
        backgroundColor: Colors.white,
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
                  builder: (context) => const AddnewclientScreen()));
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
          }),
    );
  }
}
