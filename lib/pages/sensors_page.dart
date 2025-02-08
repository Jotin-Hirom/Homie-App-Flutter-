// ignore_for_file: dead_code

// import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarthomeui/firebase_services.dart';
// import 'package:smarthomeui/pages/add_sensors_page.dart';
import 'package:smarthomeui/widgets/text_widget.dart';
import 'dart:async';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class SensorPage extends StatefulWidget {
  SensorPage({Key? key, required this.name}) : super(key: key);

  String name;

  @override
  // ignore: library_private_types_in_public_api
  _SensorPageState createState() => _SensorPageState();
}

class _SensorPageState extends State<SensorPage> {
  TextEditingController controller2 = TextEditingController();
  // late List<LiveData> chartData;
  // late ChartSeriesController _chartSeriesController;

  String text = '';
  late bool _isLoading;

  List<dynamic> valuesSensors = [];
  Map<dynamic, dynamic> map = {};
  List<dynamic> keysSensors = [];

  @override
  void initState() {
    // chartData = getChartData();
    // Timer.periodic(const Duration(minutes: 1), updateDataSource);
    _isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  Future<void> _handleRefresh() async {
    setState(() {});
    return Future.delayed(const Duration(seconds: 2));
  }

  // Future<void> readData() async {
  //   counterRef.child("Data").onValue.listen((event) {
  //     map = event.snapshot.value as Map<dynamic, dynamic>;
  //     log(map.toString());
  //   });
  //   counterRef.onValue.listen((event) {
  //     // map.addAll(event.snapshot as Map) as dynamic;
  //     // list.addAll(map as Iterable<Map>);
  //     // for (var element in list) {
  //     //   log(element.toString());
  //     // }
  //     for (var element in event.snapshot.children) {
  //       list.add(element.value);
  //     }
  //     log(list.toString());
  //     log(event.snapshot.toString());
  //   });
  // }

  @override
  void dispose() {
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // floatingActionButton: FloatingActionButton.extended(
        //   onPressed: () {
        //     Navigator.of(context).push(MaterialPageRoute(
        //       builder: (context) => AddSensors(displayName: widget.name),
        //     ));
        //   },
        //   label: const Text("Add sensors"),
        //   backgroundColor: Colors.black,
        //   focusColor: Colors.grey,
        //   splashColor: Colors.purple,
        //   hoverColor: Colors.pink,
        // ),
        appBar: AppBar(
          title: textWidget(
              text: "Sensors Room", fontWeight: FontWeight.bold, fontSize: 25),
          backgroundColor: Colors.grey,
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                CupertinoIcons.back,
                color: Colors.black,
              )),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _isLoading
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: (context, index) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey.shade300,
                                  highlightColor: Colors.grey.shade400,
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      // borderRadius: const BorderRadius.all(
                                      //   Radius.circular(15),
                                      // ),
                                    ),
                                  ),
                                ),
                              ))
                      : LiquidPullToRefresh(
                          onRefresh: _handleRefresh,
                          showChildOpacityTransition: true,
                          color: Colors.transparent,
                          backgroundColor: Colors.grey.shade800,
                          child: StreamBuilder(
                            stream: Services()
                                .counterRef
                                .child(widget.name)
                                .child("Sensors")
                                .onValue,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                      ConnectionState.waiting &&
                                  snapshot.data?.snapshot.value == null) {
                                return const SizedBox(
                                  height: 100,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.black,
                                    ),
                                  ),
                                );
                              }
                              map = snapshot.data?.snapshot.value as dynamic ??
                                  {"No Sensor is found.": 0};
                              valuesSensors.clear();
                              // log(map.toString());
                              valuesSensors = map.values.toList();
                              keysSensors = map.keys.toList();
                              // log(valuesSensors.toString());
                              // log(keysSensors.toString());
                              return AnimationLimiter(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: keysSensors.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return AnimationConfiguration.staggeredList(
                                      position: index,
                                      duration:
                                          const Duration(milliseconds: 375),
                                      child: SlideAnimation(
                                        // horizontalOffset: 50.0,
                                        verticalOffset: 200,
                                        curve: Curves.easeOutExpo,
                                        delay:
                                            const Duration(milliseconds: 100),
                                        child: FadeInAnimation(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade300,
                                              ),
                                              child: keysSensors[index] ==
                                                      "No Sensor is found."
                                                  ? Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              13.0),
                                                      child: Center(
                                                        child: textWidget(
                                                            text: keysSensors[
                                                                    index]
                                                                .toString()),
                                                      ),
                                                    )
                                                  : ListTile(
                                                      style:
                                                          ListTileStyle.drawer,
                                                      leading: CircleAvatar(
                                                        radius: 20,
                                                        child: textWidget(
                                                            text:
                                                                "${index + 1}",
                                                            fontSize: 20),
                                                      ),
                                                      title: Center(
                                                          child: textWidget(
                                                              text: keysSensors[
                                                                      index]
                                                                  .toString(),
                                                              fontSize: 20)),
                                                      // trailing: IconButton(
                                                      // alignment:
                                                      // Alignment.topLeft,
                                                      // onPressed: () {
                                                      //   AwesomeDialog(
                                                      //     dialogBackgroundColor:
                                                      //         Colors.white,
                                                      //     context: context,
                                                      //     dismissOnTouchOutside:
                                                      //         false,
                                                      //     dismissOnBackKeyPress:
                                                      //         false,
                                                      //     dialogType:
                                                      //         DialogType
                                                      //             .warning,
                                                      //     headerAnimationLoop:
                                                      //         true,
                                                      //     animType: AnimType
                                                      //         .scale,
                                                      //     descTextStyle:
                                                      //         const TextStyle(
                                                      //             color: Colors
                                                      //                 .black),
                                                      //     titleTextStyle:
                                                      //         GoogleFonts.poppins(
                                                      //             fontSize:
                                                      //                 20,
                                                      //             color: Colors
                                                      //                 .grey),
                                                      //     title: keysSensors[
                                                      //             index]
                                                      //         .toString(),
                                                      //     desc:
                                                      //         'Do you want to delete this sensor?',
                                                      //     buttonsTextStyle:
                                                      //         GoogleFonts.poppins(
                                                      //             color: Colors
                                                      //                 .black),
                                                      //     // showCloseIcon: true,
                                                      //     btnCancelText:
                                                      //         "Cancel",
                                                      //     btnOkText:
                                                      //         "Delete",
                                                      //     buttonsBorderRadius: const BorderRadius
                                                      //             .only(
                                                      //         topLeft: Radius
                                                      //             .circular(
                                                      //                 15),
                                                      //         bottomRight: Radius
                                                      //             .circular(
                                                      //                 15)),
                                                      //     reverseBtnOrder:
                                                      //         true,
                                                      //     barrierColor:
                                                      //         Colors
                                                      //             .black54,
                                                      //     btnCancelColor:
                                                      //         Colors.grey
                                                      //             .shade100,
                                                      //     btnOkColor: Colors
                                                      //         .redAccent
                                                      //         .shade100,
                                                      //     btnOkOnPress:
                                                      //         () async {
                                                      //       await Services()
                                                      //           .counterRef
                                                      //           .child(widget
                                                      //               .name)
                                                      //           .child(
                                                      //               "Sensors")
                                                      //           .child(keysSensors[
                                                      //                   index]
                                                      //               .toString())
                                                      //           .remove();
                                                      //     },
                                                      //     btnCancelOnPress:
                                                      //         () {
                                                      //       return;
                                                      //     },
                                                      //   ).show();
                                                      // },
                                                      // icon: const Icon(
                                                      //   CupertinoIcons
                                                      //       .delete,
                                                      //   // color: widget.powerOn ? Colors.white : Colors.black,
                                                      // ),
                                                      // ),
                                                    ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                ],
              ),
            ),
          ),
        ));
  }
}
