import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_tailor/constants/contantColor.dart';

// Controller for Arm Length Widget
class SalwarLengthController extends GetxController {
  var selectedLength = 'half'.obs; // Observable length value

  void updateLength(String length) {
    selectedLength.value = length;
  }
}

class ArmLengthWidget extends StatelessWidget {
  final String measurementName;
  final SalwarLengthController salwarLengthController =
      Get.put(SalwarLengthController());

  ArmLengthWidget({Key? key, required this.measurementName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment:
          CrossAxisAlignment.center, // Align elements vertically at the center
      children: [
        // Measurement Name
        Text(
          measurementName,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        // Unit Selection (half/full) with GetX state management
        Row(
          children: [
            Text('half', style: TextStyle(fontSize: 17)),
            Obx(() => Radio<String>(
                  activeColor: Constantcolor.blueColor,
                  value: 'half',
                  groupValue: salwarLengthController.selectedLength.value,
                  onChanged: (value) {
                    salwarLengthController.updateLength(value!);
                  },
                )),
            Text(
              'full',
              style: TextStyle(fontSize: 17),
            ),
            Obx(() => Radio<String>(
                  activeColor: Constantcolor.blueColor,
                  value: 'full',
                  groupValue: salwarLengthController.selectedLength.value,
                  onChanged: (value) {
                    salwarLengthController.updateLength(value!);
                  },
                )),
          ],
        ),
      ],
    );
  }
}
