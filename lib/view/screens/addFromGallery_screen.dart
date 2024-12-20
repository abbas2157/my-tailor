import 'package:flutter/material.dart';
import 'package:my_tailor/models/dress_varieties.dart';

class AddfromgalleryScreen extends StatefulWidget {
  const AddfromgalleryScreen({super.key});

  @override
  State<AddfromgalleryScreen> createState() => _AddfromgalleryScreenState();
}

class _AddfromgalleryScreenState extends State<AddfromgalleryScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: dressList.length,
          itemBuilder: (BuildContext context, int index) {
            return DressWidget(
              height: height,
              width: width,
              image: dressList[index].image,
            );
          },
        ),
      ),
    );
  }
}

class DressWidget extends StatelessWidget {
  const DressWidget({
    super.key,
    required this.height,
    required this.width,
    required this.image,
  });

  final double height;
  final double width;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Image.asset(
          image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
