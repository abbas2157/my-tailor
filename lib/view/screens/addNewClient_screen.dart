import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_tailor/constants/arm_length_widget.dart';
import 'package:my_tailor/constants/contantColor.dart';
import 'package:my_tailor/constants/customButton.dart';
import 'package:my_tailor/constants/custom_container.dart';
import 'package:my_tailor/constants/measurement_widget.dart';
import 'package:my_tailor/constants/payment_widget.dart';

class AddnewclientScreen extends StatefulWidget {
  const AddnewclientScreen({super.key});

  @override
  State<AddnewclientScreen> createState() => _AddnewclientScreenState();
}

class _AddnewclientScreenState extends State<AddnewclientScreen> {
  bool _switchValue = false;
  bool _measurSwitch = false;
  TextEditingController _dateController = TextEditingController();
  TextEditingController _remindDate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Client Name",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  // BoxShadow(
                  //   color: Colors.black12,
                  //   spreadRadius: 1,
                  //   blurRadius: 7,
                  //   offset: Offset(0, 3),
                  // )
                ]),
                height: height * 0.25,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Constantcolor.blueColor),
                          ),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Constantcolor.blueColor,
                            size: 30,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 13),
                          hintText: 'Client Name'),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Constantcolor.blueColor),
                          ),
                          prefixIcon: Icon(
                            Icons.call,
                            color: Constantcolor.blueColor,
                            size: 30,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 13),
                          hintText: 'Phone number'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Constantcolor.blueColor),
                          ),
                          prefixIcon: Icon(
                            Icons.location_on,
                            color: Constantcolor.blueColor,
                            size: 30,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 13),
                          hintText: 'Client Location',
                          hintStyle: TextStyle(color: Colors.black54)),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Constantcolor.blueColor),
                          ),
                          prefixIcon: Icon(
                            Icons.tag,
                            color: Constantcolor.blueColor,
                            size: 30,
                          ),
                          suffixIcon: Icon(
                            Icons.info_outline,
                            color: Constantcolor.blueColor,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 13),
                          hintText: 'Cloth Unique Number',
                          hintStyle: TextStyle(color: Colors.black54)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                'Delivery Date',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blue.withOpacity(0.03),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Constantcolor.blueColor)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Constantcolor.blueColor),
                  ),
                  hintText: 'Set Date',
                  hintStyle: TextStyle(color: Colors.black54),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.calendar_today,
                      color: Constantcolor.blueColor,
                    ),
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );

                      if (pickedDate != null) {
                        setState(() {
                          _dateController.text =
                              DateFormat('dd-MM-yyyy').format(pickedDate);
                        });
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                'Remind Date',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blue.withOpacity(0.03),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Constantcolor.blueColor)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Constantcolor.blueColor),
                  ),
                  hintText: 'Set Date',
                  hintStyle: TextStyle(color: Colors.black54),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.calendar_today,
                      color: Constantcolor.blueColor,
                    ),
                    onPressed: () async {
                      DateTime? remindDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );

                      if (remindDate != null) {
                        setState(() {
                          _remindDate.text =
                              DateFormat('dd-MM-yyyy').format(remindDate);
                        });
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Mark as Urgent',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  Switch(
                      inactiveTrackColor: Colors.white,
                      activeTrackColor: Constantcolor.blueColor,
                      value: _switchValue,
                      onChanged: (value) {
                        setState(() {
                          _switchValue = value;
                        });
                      }),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                'Add Measurement :',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Measurement Dress Given',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  Switch(
                      inactiveTrackColor: Colors.white,
                      activeTrackColor: Constantcolor.blueColor,
                      value: _measurSwitch,
                      onChanged: (value) {
                        setState(() {
                          _measurSwitch = value;
                        });
                      }),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                'Kurta :',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              MeasurementWidget(measurementName: 'Length'),
              MeasurementWidget(measurementName: 'Shoulder'),
              MeasurementWidget(measurementName: 'Chest'),
              MeasurementWidget(measurementName: 'Waist'),
              MeasurementWidget(measurementName: 'Hip'),
              MeasurementWidget(measurementName: 'Gher'),
              MeasurementWidget(measurementName: 'Arm length'),
              ArmLengthWidget(measurementName: 'Arm Length Type'),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                'Salwar :',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              MeasurementWidget(measurementName: 'Length'),
              MeasurementWidget(measurementName: 'Waist'),
              MeasurementWidget(measurementName: 'Hip'),
              MeasurementWidget(measurementName: 'Mori'),
              MeasurementWidget(measurementName: 'Around Leg'),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                'Payment Status :',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              PaymentWidget(paymentName: 'Total Amount'),
              PaymentWidget(paymentName: 'Advanced Amount'),
              PaymentWidget(paymentName: 'Due Amount'),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                'Special Instructions :',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CustomContainer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: MyCustomButton(
                    size: Size.fromWidth(width),
                    child: Text(
                      'Save',
                      style: TextStyle(
                          color: Constantcolor.whColor,
                          fontSize: 23,
                          fontWeight: FontWeight.w600),
                    ),
                    color: Constantcolor.blueColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
