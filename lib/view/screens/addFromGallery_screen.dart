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
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [DressWidget(height: height, width: width,image: DressVarieties(image: image, varietyName: varietyName).,)],
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
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          scrollDirection: Axis.vertical,
          itemCount: 20,
          itemBuilder: (BuildContext context, index) {
            return Container(
              color: Colors.black12,
              height: 50,
              width: 50,
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.2,
                    width: width * 0.3,
                    child: Image.asset(
                      image,
                      fit: BoxFit.fill,
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
