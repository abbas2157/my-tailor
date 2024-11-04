import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_tailor/constants/contantColor.dart';

class AddnewclientScreen extends StatefulWidget {
  const AddnewclientScreen({super.key});

  @override
  State<AddnewclientScreen> createState() => _AddnewclientScreenState();
}

class _AddnewclientScreenState extends State<AddnewclientScreen> {
  bool _switchValue = false;
  TextEditingController _dateController = TextEditingController();
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
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
