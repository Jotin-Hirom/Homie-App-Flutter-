// ignore_for_file: dead_code, use_build_context_synchronously

import 'dart:developer';

import 'package:easy_loading_button/easy_loading_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarthomeui/widgets/text_widget.dart';
import 'package:smarthomeui/widgets/textfield_page.dart';

import '../firebase_services.dart';

// ignore: must_be_immutable
class AddSensors extends StatefulWidget {
  AddSensors({super.key, required this.displayName});
  String displayName;

  @override
  State<AddSensors> createState() => _AddSensorsState();
}

class _AddSensorsState extends State<AddSensors> {
  List<AddData> list = [];
  TextEditingController controller = TextEditingController();
  TextEditingController controller1 = TextEditingController();
  List datatype = [];
  Map<String, dynamic> dataToBeUpload = {};

  String text = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset("lib/icons/sensor.png", height: 100),
                textWidget(
                  text: "Add a sensor ",
                  fontSize: 25,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 30,
                ),
                MyTextField(
                  label: 'Sensor name',
                  myController: controller,
                  myInput: TextInputType.text,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text.rich(
                    const TextSpan(
                        text:
                            "Press the above button to add the sensor value."),
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                Flexible(
                    child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) => list[index],
                )),
                Container(
                  alignment: const Alignment(0, 0),
                  child: EasyButton(
                    onPressed: () {
                      if (controller.text == "") {
                        EasyLoading.showError("Fill the sensor name");
                        return;
                      }
                      if (datatype.isEmpty) {
                        EasyLoading.showError("Fill the sensor value");
                        return;
                      }
                      setState(() {
                        text = controller.text;
                        controller.clear();
                      });
                      // ignore: avoid_function_literals_in_foreach_calls
                      datatype.forEach((element) async {
                        log(element.toString());
                        try {
                          await Services()
                              .counterRef
                              .child(widget.displayName)
                              .child("Sensors")
                              .child(text)
                              .update(element);
                          EasyLoading.showSuccess('Device is added');
                        } catch (e) {
                          EasyLoading.showError("Can't add the sensor.");
                        }
                        Navigator.pop(context);
                      }); 
                    },
                    type: EasyButtonType.elevated,
                    idleStateWidget: const Text(
                      'Add',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    loadingStateWidget: const CircularProgressIndicator(
                      strokeWidth: 3.0,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.white,
                      ),
                    ),
                    useWidthAnimation: true,
                    useEqualLoadingStateWidgetDimension: true,
                    width: 150.0,
                    height: 30.0,
                    borderRadius: 4.0,
                    elevation: 1,
                    contentGap: 6.0,
                    buttonColor: Colors.black,
                  ),
                ),
              ]),
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          if (list.isNotEmpty) {
            return;
          }
          list.add(AddData(
            controller1: controller1,
            datatype: datatype,
          ));
          setState(() {});
        },
        tooltip: "You can add only 5 sensor values.",
        backgroundColor: Colors.black,
        focusColor: Colors.grey,
        splashColor: Colors.purple,
        hoverColor: Colors.pink,
        child: const Icon(
          CupertinoIcons.add_circled,
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}

// ignore: must_be_immutable
class AddData extends StatefulWidget {
  AddData({super.key, required this.datatype, required this.controller1});
  List datatype;
  TextEditingController controller1;
  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  final items = ["Bool", "Double", "Number", "String"];

  // ignore: prefer_typing_uninitialized_variables
  var value;
  String data = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10.0),
      child: Container(
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          // color: Colors.black,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              child: MyTextField(
                  myController: widget.controller1,
                  myInput: TextInputType.text,
                  label: "Enter sensor value"),
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                // value: value,
                items: items.map(buildDropDown).toList(),
                onChanged: (value) {
                  if (widget.controller1.text == "") {
                    return;
                  }
                  setState(() {
                    this.value = value;
                    if (value == "String") {
                      widget.datatype.add({widget.controller1.text.trim(): ""});
                    } else if (value == "Double") {
                      widget.datatype
                          .add({widget.controller1.text.trim(): 0.0});
                    } else if (value == "Number") {
                      widget.datatype.add({widget.controller1.text.trim(): 0});
                    } else if (value == "Bool") {
                      widget.datatype
                          .add({widget.controller1.text.trim(): false});
                    } else {
                      return;
                    }
                    widget.controller1.clear();
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildDropDown(String text) =>
      DropdownMenuItem(value: text, child: textWidget(text: text));
}
