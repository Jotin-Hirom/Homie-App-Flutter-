import 'dart:async';
import 'dart:developer';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:smarthomeui/provider/documentation_shared_provider.dart';
import 'package:smarthomeui/provider/timer.dart';
import 'package:smarthomeui/util/smart_device_box.dart';
import 'package:smarthomeui/widgets/custom_drawer.dart';
import 'package:smarthomeui/widgets/text_widget.dart';
import 'package:smarthomeui/widgets/textfield_page.dart';
import 'package:easy_loading_button/easy_loading_button.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage(
      {super.key,
      required this.displayName,
      required this.email,
      required this.photoURL});
  String displayName;
  String email;
  String photoURL;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final scaffoldState = GlobalKey<ScaffoldState>();

  Duration duration = const Duration();

  Timer? timer;

  late final AnimationController animeAdd;
  late final AnimationController animeBelow;
  TextEditingController controller = TextEditingController();
  TextEditingController searchController = TextEditingController();

  final double horizontalPadding = 15;
  final double verticalPadding = 25;

  final counterRef = FirebaseDatabase.instance.ref();

  List<dynamic> deviceValues = [];
  Map<dynamic, dynamic> streamData = {};
  List<dynamic> deviceNames = [];
  late List<dynamic> searchList;

  List<dynamic> sensorValues = [];
  Map<dynamic, dynamic> sensorData = {};

  String name = '';
  String text = '';

  String deviceName = "";

  // ignore: prefer_typing_uninitialized_variables
  var timeCheck;

  bool animeState = false;
  bool animeStateBelow = false;
  bool value = false;
  bool isCount = true;
  bool isSet = false;

  bool? powerBool;

  int setTimer = 0;
  @override
  void initState() {
    name = widget.displayName;
    Provider.of<Documentation>(context, listen: false)
        .loadSetting(name: widget.displayName);
    animeBelow =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    animeAdd =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    super.initState();
  }

  Future<void> _handleRefresh() async {
    // ignore: await_only_futures
    await counterRef.child(name).child("Devices");
  }

  // ignore: prefer_final_fields
  String _connection = "false";
  connectionCheck() async {
    EasyLoading.show(status: "Checking...", dismissOnTap: true);
    await FirebaseDatabase.instance
        .ref()
        .child(name)
        .child("Connection")
        .once()
        .then((event) {
      log(event.snapshot.value.toString());
      // ignore: unnecessary_null_comparison
      if (event.snapshot.value.toString() == null) {
        FirebaseDatabase.instance
            .ref()
            .child(name)
            .update({"Connection": _connection});
      } else {
        _connection = event.snapshot.value.toString();
        if (_connection == "false") {
          EasyLoading.showError("Not connected with micro-controller");
        } else {
          EasyLoading.showSuccess("Connected with micro-controller");
        }
      }
      EasyLoading.dismiss();
    });
    EasyLoading.dismiss();
    return Future.delayed(const Duration(seconds: 2));
  }

  @override
  void dispose() {
    controller.dispose();
    searchController.dispose();
    animeAdd.dispose();
    animeBelow.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final timeProvider = Provider.of<TimerProvider>(context, listen: false);
    var splitName = name.split(" ");
    log(splitName[1].toString());

    //back press to exit
    return WillPopScope(
      onWillPop: () async {
        bool? exit = await AwesomeDialog(
          dialogBackgroundColor: Colors.white,
          context: context,
          dismissOnTouchOutside: false,
          dismissOnBackKeyPress: false,
          dialogType: DialogType.noHeader,
          headerAnimationLoop: true,
          animType: AnimType.scale,
          descTextStyle: const TextStyle(color: Colors.black),
          titleTextStyle:
              GoogleFonts.poppins(fontSize: 20, color: Colors.grey.shade800),
          title: 'Hey, ${widget.displayName}',
          desc: 'Do you want to close the app?',
          buttonsTextStyle: const TextStyle(color: Colors.black),
          btnCancelText: "Cancel",
          btnOkText: "Okay",
          buttonsBorderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
          reverseBtnOrder: true,
          barrierColor: Colors.black54,
          btnOkColor: Colors.grey.shade200,
          btnCancelColor: Colors.redAccent.shade100,
          btnOkOnPress: () {
            SystemNavigator.pop(animated: true);
          },
          btnCancelOnPress: () {
            return;
          },
        ).show();
        return exit ?? false;
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          tooltip: "Add devices",
          onPressed: () {
            addDevice(context);
          },
          label: textWidget(text: "Add Devices", color: Colors.white),
          backgroundColor: Colors.black,
          focusColor: Colors.grey,
          splashColor: Colors.purple,
          hoverColor: Colors.pink,
        ),
        //open nav bar
        drawer: CustomDrawer(
          displayName: name,
          email: widget.email,
          photoURL: widget.photoURL,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        alignment: Alignment(0.80, -0.66),
                        image: AssetImage("lib/icons/iot.png"))),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Builder(builder: (context) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //open nav bar
                        IconButton(
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            icon:
                                Icon(Icons.menu, color: Colors.grey.shade800)),

                        //Temperature and add device row
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.thermometer,
                              color: Colors.orange.shade800,
                              size: 30,
                            ),
                            StreamBuilder<DatabaseEvent>(
                              stream: FirebaseDatabase.instance
                                  .ref()
                                  .child(name)
                                  .child("Sensors")
                                  .child("DHT11")
                                  .onValue,
                              builder: (context, snapshot) {
                                Map<dynamic, dynamic> tempMap = {};
                                dynamic temp;
                                if (snapshot.connectionState ==
                                    ConnectionState.active) {
                                  if (snapshot.data?.snapshot.value != null) {
                                    tempMap = snapshot.data?.snapshot.value
                                        as dynamic;
                                    temp = tempMap["Temperature"];
                                    log(temp.toString());
                                    return Center(
                                        child: textWidget(
                                            text: "$temp\u00b0C",
                                            fontSize: 20));
                                  } else {
                                    return Center(
                                        child: textWidget(
                                            text: "27\u00b0C", fontSize: 20));
                                  }
                                } else {
                                  return Center(
                                      child: textWidget(
                                          text: "29\u00b0C", fontSize: 20));
                                }
                              },
                            )
                          ],
                        ),

                        //welcome and name display
                        textWidget(
                          text: "Welcome",
                          fontSize: 20,
                        ),
                        textWidget(
                          text: splitName[1].toString(),
                          fontSize: 25,
                        ),
                      ],
                    );
                  }),
                ),
              ),

              //divider with home
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Lottie.asset("assets/lottie/home.json",
                            height: 70,
                            width: 50,
                            alignment: Alignment.topCenter)),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey.shade800,
                      ),
                    )
                  ],
                ),
              ),
              //smart devices and  add devices fn call
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textWidget(
                          text: "Smart Devices",
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                        // SizedBox(
                        //   width: 10,
                        // ),
                        Consumer<TimerProvider>(
                          builder: (context, data, child) {
                            return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: IconButton(
                                    tooltip:
                                        "Check the connectivity between Micro-Controller and Homie.",
                                    onPressed: () async {
                                      await timeProvider.connectionCheck(name);
                                    },
                                    icon: const Icon(
                                      CupertinoIcons.arrow_up_arrow_down_circle,
                                      size: 30,
                                      color: Colors.black,
                                    )));
                          },
                        ),
                      ],
                    ),
                    //search bar
                  ],
                ),
              ),

              // devices controller
              Expanded(
                  child: LiquidPullToRefresh(
                onRefresh: _handleRefresh,
                springAnimationDurationInMilliseconds: 1000,
                animSpeedFactor: 5,
                showChildOpacityTransition: true,
                color: Colors.white,
                backgroundColor: Colors.grey.shade800,
                child: StreamBuilder(
                  stream: counterRef.child(name).child("Devices").onValue,
                  // .where(
                  //     (event) => event.snapshot.children
                  //         .contains(searchController.text)),
                  // .where((event) => false)
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      if (snapshot.hasData) {
                        if (snapshot.data!.snapshot.value != null) {
                          streamData = snapshot.data?.snapshot.value as dynamic;
                          deviceValues.clear();
                          deviceValues = streamData.values.toList(); //value
                          deviceNames = streamData.keys.toList(); //device names
                          return AnimationLimiter(
                            child: GridView.builder(
                              // scrollDirection: Axis.horizontal,
                              // physics: const NeverScrollableScrollPhysics(),
                              itemCount: deviceNames.length,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1 / 1.3,
                              ),
                              itemBuilder: (context, index) {
                                //add and delete timer for devices controller
                                return AnimationConfiguration.staggeredGrid(
                                  position: index,
                                  duration: const Duration(milliseconds: 375),
                                  columnCount: deviceNames.length,
                                  child: SlideAnimation(
                                    // horizontalOffset: 50.0,
                                    verticalOffset: 200,
                                    curve: Curves.easeOutExpo,
                                    delay: const Duration(milliseconds: 100),
                                    child: FadeInAnimation(
                                      child: GestureDetector(
                                        onTap: () async {
                                          if (deviceValues[index]["switch"]) {
                                            // ignore: use_build_context_synchronously
                                            AwesomeDialog(
                                              dialogBackgroundColor:
                                                  Colors.white,
                                              context: context,
                                              dismissOnTouchOutside: false,
                                              dismissOnBackKeyPress: false,
                                              dialogType: DialogType.noHeader,
                                              headerAnimationLoop: true,
                                              animType: AnimType.scale,
                                              body: deviceValues[index]["isSet"]
                                                  ? const SizedBox.shrink()
                                                  : MultiSelectDropDown(
                                                      hint:
                                                          'Set the timer for this ${deviceNames[index]}',
                                                      onOptionSelected:
                                                          (options) {
                                                        debugPrint(
                                                            options.toString());
                                                        for (var element
                                                            in options) {
                                                          timeCheck = element
                                                              .label
                                                              .split(" ")
                                                              .last
                                                              .toString();
                                                          setTimer = int.parse(
                                                              element.value
                                                                  .toString());
                                                          timeProvider
                                                              .updateTime(
                                                                  setTimer,
                                                                  timeCheck);
                                                        }
                                                      },
                                                      options: const <ValueItem>[
                                                        ValueItem(
                                                            label: '1 min',
                                                            value: "1"),
                                                        ValueItem(
                                                            label: '15 mins',
                                                            value: "15"),
                                                        ValueItem(
                                                            label: '30 mins',
                                                            value: '30'),
                                                        ValueItem(
                                                            label: '1 hr',
                                                            value: '1'),
                                                        ValueItem(
                                                            label: '2 hrs',
                                                            value: '2'),
                                                        ValueItem(
                                                            label: '3 hrs',
                                                            value: '3'),
                                                        ValueItem(
                                                            label: '4 hrs',
                                                            value: "4"),
                                                        ValueItem(
                                                            label: '5 hrs',
                                                            value: "5"),
                                                      ],
                                                      selectionType:
                                                          SelectionType.single,
                                                      chipConfig:
                                                          const ChipConfig(
                                                              wrapType:
                                                                  WrapType.wrap,
                                                              backgroundColor:
                                                                  Colors.red),
                                                      dropdownHeight: 300,
                                                      optionTextStyle:
                                                          const TextStyle(
                                                              fontSize: 16),
                                                      selectedOptionIcon:
                                                          const Icon(
                                                        Icons.checklist,
                                                        color: Colors.pink,
                                                      ),
                                                      selectedOptionTextColor:
                                                          Colors.blue,
                                                    ),
                                              buttonsTextStyle: const TextStyle(
                                                  color: Colors.black),
                                              // showCloseIcon: true,
                                              btnCancelText:
                                                  !deviceValues[index]["isSet"]
                                                      ? "Cancel"
                                                      : "Leave",
                                              btnOkText: !deviceValues[index]
                                                      ["isSet"]
                                                  ? "Set"
                                                  : "Reset",
                                              buttonsBorderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(15),
                                                      bottomRight:
                                                          Radius.circular(15)),
                                              reverseBtnOrder: true,
                                              barrierColor: Colors.black54,
                                              btnOkColor: Colors.grey.shade100,
                                              btnCancelColor:
                                                  Colors.redAccent.shade100,
                                              btnOkOnPress: () async {
                                                if (!deviceValues[index]
                                                    ["isSet"]) {
                                                  deviceName =
                                                      deviceNames[index];
                                                  timeProvider.uploadTime(
                                                      name: name,
                                                      deviceName: deviceName);
                                                  timeProvider.startTimer(
                                                      name, deviceName);
                                                } else {
                                                  // try {
                                                  //   await FirebaseDatabase
                                                  //       .instance
                                                  //       .ref()
                                                  //       .child(name)
                                                  //       .child("Devices")
                                                  //       .child(deviceNames[index])
                                                  //       .update({
                                                  //     "start": 0,
                                                  //     "end": 0,
                                                  //     "counting": 0,
                                                  //     "isCount": false,
                                                  //     "isSet": false,
                                                  //     "switch": false
                                                  //   });
                                                  // } catch (e) {
                                                  //   debugPrint(e.toString());
                                                  // }
                                                  timeProvider.stopTimer(
                                                      deviceName:
                                                          deviceNames[index],
                                                      name: name);
                                                }
                                              },
                                              btnCancelOnPress: () {
                                                return;
                                              },
                                            ).show();
                                          }
                                        },
                                        child: SmartDeviceBox(
                                          smartDeviceName: deviceNames[index],
                                          iconPath: "lib/icons/iconPath.png",
                                          powerOn: deviceValues[index]
                                              ["switch"],
                                          name: name,
                                          check: deviceValues[index]["isCount"],
                                          // counting : deviceValues[index]["counting"]
                                          // deviceValuesListCopy: ,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        } else {
                          Center(
                            //if snapshot data is null
                            child: textWidget(
                              text: "No devices.",
                              fontSize: 20,
                            ),
                          );
                        }
                      }
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      );
                    } else {
                      return Center(
                          child: textWidget(
                              text: "Oops! Can't stream the data.",
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.bold));
                    }
                    //if no devices found, this will show
                    return Column(
                      children: [
                        AnimatedTextKit(
                          repeatForever: true,
                          isRepeatingAnimation: true,
                          animatedTexts: [
                            TyperAnimatedText(
                              "Add devices to be smart.",
                              curve: Curves.fastLinearToSlowEaseIn,
                              speed: const Duration(milliseconds: 200),
                              textStyle: GoogleFonts.poppins(
                                fontSize: 20,
                                color: Colors.grey.shade800,
                              ),
                            ),
                          ],
                        ),
                        Flexible(
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                if (animeStateBelow == false) {
                                  animeStateBelow = true;
                                  animeBelow.forward();
                                } else {
                                  animeStateBelow = false;
                                  animeBelow.reverse();
                                }
                              },
                              child: Lottie.asset("assets/lottie/sliver.json",
                                  reverse: true,
                                  fit: BoxFit.cover,
                                  controller: animeBelow),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

//add device show model
  Future<dynamic> addDevice(BuildContext context) async {
    // List<String> list = <String>['Devices', 'Sensors'];
    // String dropdownValue = list.first;
    return showModalBottomSheet(
      backgroundColor: Colors.white,
      enableDrag: true,
      isScrollControlled: true,
      useRootNavigator: true,
      useSafeArea: false,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    if (animeState == false) {
                      animeState = true;
                      animeAdd.forward();
                    } else {
                      animeState = false;
                      animeAdd.reverse();
                    }
                  },
                  child: Lottie.asset("assets/lottie/addDevice.json",
                      fit: BoxFit.cover, controller: animeAdd),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    textWidget(
                      text: "Create a new device",
                      fontSize: 25,
                      color: Colors.black,
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                MyTextField(
                  label: 'Device name',
                  myController: controller,
                  myInput: TextInputType.text,
                ),
                const SizedBox(
                  height: 30,
                ),
                EasyButton(
                  onPressed: () async {
                    if (controller.text == "") {
                      EasyLoading.showError("Fill the device name form");
                      return;
                    }
                    text = '';
                    try {
                      await counterRef
                          .child(name)
                          .child("Devices")
                          .child(controller.text.trim())
                          .update({
                        "switch": false,
                        "isSet": false,
                        "isCount": false
                      });
                      EasyLoading.showSuccess('Device is added');
                      await Future.delayed(const Duration(seconds: 2));
                    } catch (e) {
                      EasyLoading.showError("Can't add the device");
                    }
                    setState(() {
                      text = controller.text;
                      controller.clear();
                    });
                    EasyLoading.dismiss();
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pop();
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
              ]),
        );
      },
    );
  }
}
