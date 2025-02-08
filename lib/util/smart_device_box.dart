import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smarthomeui/provider/timer.dart';
import 'package:smarthomeui/widgets/text_widget.dart';

class SmartDeviceBox extends StatefulWidget {
  final String smartDeviceName;
  final String iconPath;
  final bool powerOn;
  final bool check;
  final String name;
  // final List deviceValuesListCopy;

  const SmartDeviceBox(
      {super.key,
      // required this.deviceValuesListCopy,
      required this.smartDeviceName,
      required this.iconPath,
      required this.powerOn,
      required this.name,
      required this.check});

  @override
  State<SmartDeviceBox> createState() => _SmartDeviceBoxState();
}

class _SmartDeviceBoxState extends State<SmartDeviceBox> {
  final counterRef = FirebaseDatabase.instance.ref();
  @override
  void initState() {
    debugPrint(widget.check.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerProvider>(context, listen: false);
    // String twoDigits(int n) => n.toString().padLeft(2, '0'); //9>09 11>11
    // final hours = twoDigits(provider.duration.inHours);
    // final minutes = twoDigits(provider.duration.inMinutes.remainder(60));
    // final seconds = twoDigits(provider.duration.inSeconds.remainder(60));

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: widget.powerOn
              ? Colors.grey[900]
              : const Color.fromARGB(44, 164, 167, 189),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 9),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    widget.iconPath,
                    height: 65,
                    color: widget.powerOn ? null : Colors.grey.shade800,
                  ),
                  IconButton(
                      alignment: Alignment.topLeft,
                      onPressed: () {
                        AwesomeDialog(
                          dialogBackgroundColor: Colors.white,
                          context: context,
                          dismissOnTouchOutside: false,
                          dismissOnBackKeyPress: false,
                          dialogType: DialogType.warning,
                          headerAnimationLoop: true,
                          animType: AnimType.scale,
                          descTextStyle:
                              GoogleFonts.poppins(color: Colors.black),
                          titleTextStyle: GoogleFonts.poppins(
                              fontSize: 20, color: Colors.grey.shade800),
                          title: widget.smartDeviceName,
                          desc: 'Do you want to delete this device?',
                          buttonsTextStyle:
                              GoogleFonts.poppins(color: Colors.black),
                          // showCloseIcon: true,
                          btnCancelText: "Cancel",
                          btnOkText: "Delete",
                          buttonsBorderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                          reverseBtnOrder: true,
                          barrierColor: Colors.black54,
                          btnCancelColor: Colors.grey.shade100,
                          btnOkColor: Colors.redAccent.shade100,
                          btnOkOnPress: () async {
                            await counterRef
                                .child(widget.name)
                                .child("Devices")
                                .child(widget.smartDeviceName)
                                .remove();
                          },
                          btnCancelOnPress: () {
                            return;
                          },
                        ).show();
                      },
                      icon: Icon(
                        CupertinoIcons.delete,
                        color: widget.powerOn ? Colors.white : Colors.black,
                      ))
                ],
              ),
              // icon
              if (widget.powerOn && widget.check)
                Consumer<TimerProvider>(
                  builder: (context, value, child) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: provider.seconds == 0
                          ? const SizedBox()
                          : Center(
                              child: textWidget(
                                  text: "${provider.counting} seconds left.",
                                  color: Colors.white),
                            ),
                    );
                  },
                ),

              // smart device name + switch
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: SizedBox(
                        height: 30,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: textWidget(
                            text:
                                // maxLines: 1,
                                widget.smartDeviceName,
                            // overflow: TextOverflow.ellipsis,

                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: widget.powerOn ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle: pi / 2,
                    child: CupertinoSwitch(
                      value: widget.powerOn,
                      onChanged: (value) async {
                        await counterRef
                            .child(widget.name)
                            .child("Devices")
                            .child(widget.smartDeviceName)
                            .update({"switch": value});
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
