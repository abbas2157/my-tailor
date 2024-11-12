import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_tailor/constants/contantColor.dart';

// Controller for Measurement Widget
class MeasurementController extends GetxController {
  var selectedUnit = 'cm'.obs; // Observable unit value

  void updateUnit(String unit) {
    selectedUnit.value = unit;
  }
}

class MeasurementWidget extends StatelessWidget {
  final String measurementName;
  final TextEditingController controller = TextEditingController();
  final MeasurementController measurementController =
      Get.put(MeasurementController());

  MeasurementWidget({Key? key, required this.measurementName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).height * 1;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Measurement Name
          Text(
            measurementName,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
          ),
          // TextFormField for entering number

          // Unit Selection (cm/inch) with GetX state management
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 50,
                height: 20, // Set a consistent height for alignment
                child: TextFormField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Constantcolor.blueColor),
                    ),
                    hintText: '',
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 10), // Adjust padding to align text
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: width * 0.02,
              ),
              Text('inch', style: TextStyle(fontSize: 17)),
            ],
          ),
        ],
      ),
    );
  }
}
