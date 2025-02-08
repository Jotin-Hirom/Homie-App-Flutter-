// import 'package:flutter/material.dart';
// import 'package:statusbar/statusbar.dart';
// void main() => runApp(new MyApp());
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => new _MyAppState();
// }
// class _MyAppState extends State<MyApp> {
//   @override
//   void initState() {
//     super.initState();
//     StatusBar.color(Colors.red);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       home: Text(""),
//     );
//   }
// }





// import 'package:animated_custom_dropdown/custom_dropdown.dart';
// import 'package:flutter/material.dart';
// class CustomDropdownExample extends StatefulWidget {
//   const CustomDropdownExample({Key? key}) : super(key: key);
//   @override
//   State<CustomDropdownExample> createState() => _CustomDropdownExampleState();
// }
// class _CustomDropdownExampleState extends State<CustomDropdownExample> {
//   final jobRoleCtrl = TextEditingController();
//   Future<List<String>> getFakeRequestData(String query) async {
//     List<String> data = ['Developer', 'Designer', 'Consultant', 'Student'];
//     return await Future.delayed(const Duration(seconds: 1), () {
//       return data.where((e) {
//         return e.toLowerCase().contains(query.toLowerCase());
//       }).toList();
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return CustomDropdown.searchRequest(
//       futureRequest: getFakeRequestData,
//       hintText: 'Search job role',
//       controller: jobRoleCtrl,
//       futureRequestDelay: const Duration(seconds: 3),//it waits 3 seconds before start searching (before execute the 'futureRequest' function)
//     );
//   }
// }






 // showDialog(
        //   context: context,
        //   builder: (context) {
        //     return AlertDialog(
        //       elevation: 10,
        //       title: Text("Hey, ${widget.displayName}"),
        //       content: const Text("Do you want to close the app?"),
        //       actions: [
        //         TextButton(
        //             onPressed: () {
        //               Navigator.of(context).pop(true);
        //             },
        //             child: const Text("Yes")),
        //         TextButton(
        //             onPressed: () {
        //               Navigator.of(context).pop(false);
        //             },
        //             child: const Text("No"))
        //       ],
        //     );
        //   },
        // );






           // AnimatedTextKit(
                            //   repeatForever: true,
                            //   isRepeatingAnimation: true,
                            //   animatedTexts: [
                            //     TyperAnimatedText(
                            //       "Add device",
                            //       speed: const Duration(milliseconds: 100),
                            //       textStyle: GoogleFonts.poppins(
                            //           fontSize: 20,
                            //           color: Colors.grey.shade800),
                            //     ),
                            //   ],
                            // )






   // OutlinedButton(
                  //   onPressed: () {},
                  //   style: OutlinedButton.styleFrom(
                  //       foregroundColor: Colors.black,
                  //       side: BorderSide(
                  //         color: Colors.grey.shade700,
                  //       ),
                  //       padding: const EdgeInsets.symmetric(horizontal: 5),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(20),
                  //       )),
                  //   child: Text(
                  //     "Add",
                  //     style: GoogleFonts.archivoBlack(
                  //       fontSize: 12,
                  //       color: Colors.black,
                  //     ),
                  //   ),
//                   // ),







//  DropdownButtonFormField(
//                       icon: const Icon(Icons.arrow_drop_down_circle_outlined,
//                           color: Colors.black),
//                       value: dropdownValue,
//                       decoration: InputDecoration(
//                           labelText: "Select controller",
//                           labelStyle: GoogleFonts.poppins(
//                             color: Colors.black,
//                           ),
//                           prefixIcon: const Icon(
//                             Icons.abc,
//                             color: Colors.black,
//                           )),
//                       items: list
//                           .map(
//                             (e) => DropdownMenuItem(
//                               child: Text(e,
//                                   style: GoogleFonts.poppins(
//                                     color: Colors.black,
//                                   )),
//                               value: e,
//                             ),
//                           )
//                           .toList(),
//                       onChanged: (value) {
//                         setState(() {
//                           dropdownValue = value!;
//                         });
//                       })




//  MultiSelectDropDown(
//                     selectedOptions: [],
//                     onOptionSelected: (options) {
//                       // debugPrint(options.toString());
//                       for (var element in options) {
//                         option.add(element);
//                         // debugPrint(element.value);
//                       }
//                     },
//                     options: const <ValueItem>[
//                       ValueItem(label: 'Devices', value: 'Devices'),
//                       ValueItem(label: 'Sensors', value: 'Sensors'),
//                     ],
//                     selectionType: SelectionType.single,
//                     chipConfig: const ChipConfig(
//                         wrapType: WrapType.wrap, backgroundColor: Colors.red),
//                     dropdownHeight: 300,
//                     optionTextStyle: const TextStyle(fontSize: 16),
//                     selectedOptionIcon: const Icon(
//                       Icons.checklist,
//                       color: Colors.pink,
//                     ),
//                     selectedOptionTextColor: Colors.blue,
//                   ),





   // const PopUpMenu(
                        //   menuList: [
                        //     PopupMenuItem(
                        //       child: ListTile(
                        //         leading: Icon(
                        //           CupertinoIcons.person,
                        //         ),
                        //         title: Text("My Profile"),
                        //       ),
                        //     ),
                        //     // PopupMenuItem(
                        //     //   child: ListTile(
                        //     //     leading: Icon(
                        //     //       CupertinoIcons.bag,
                        //     //     ),
                        //     //     title: Text("My Bag"),
                        //     //   ),
                        //     // ),
                        //     // PopupMenuDivider(),
                        //     // PopupMenuItem(
                        //     //   child: Text("Settings"),
                        //     // ),
                        //     // PopupMenuItem(
                        //     //   child: Text("About Us"),
                        //     // ),
                        //     // PopupMenuDivider(),
                        //     // PopupMenuItem(
                        //     //   child: ListTile(
                        //     //     leading: Icon(
                        //     //       Icons.logout,
                        //     //     ),
                        //     //     title: Text("Log Out"),
                        //     //   ),
                        //     // ),
                        //   ],
                        //   // icon: CircleAvatar(
                        //   //   backgroundImage: const NetworkImage(
                        //   //     'https://images.unsplash.com/photo-1644982647869-e1337f992828?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80',
                        //   //   ),
                        //   //   child: Container(),
                        //   // ),
                        // );







// NestedScrollView(
//           floatHeaderSlivers: true,
//           headerSliverBuilder: (context, innerBoxIsScrolled) => [
//             SliverAppBar(
//               snap: true,
//               automaticallyImplyLeading: false,
//               expandedHeight: 220,
//               flexibleSpace: FlexibleSpaceBar(
//                 title: Container(
//                     width: 150,
//                     height: 15,
//                     decoration: BoxDecoration(
//                       borderRadius: const BorderRadius.only(
//                         topRight: Radius.circular(20),
//                         bottomLeft: Radius.circular(20),
//                       ),
//                       color: Colors.blue.shade100,
//                     ),
//                     child: Center(
//                       child: AnimatedTextKit(
//                         repeatForever: true,
//                         isRepeatingAnimation: true,
//                         animatedTexts: [
//                           WavyAnimatedText(
//                             "Smart Appliances",
//                             speed: const Duration(milliseconds: 500),
//                             textStyle: GoogleFonts.poppins(
//                               fontSize: 10,
//                               color: Colors.blue,
//                             ),
//                           ),
//                         ],
//                       ),
//                     )),
//                 centerTitle: true,
//                 background: Lottie.asset(
//                   "assets/lottie/sliver.json",
//                   fit: BoxFit.fill,
//                 ),
//                 stretchModes: const [
//                   StretchMode.zoomBackground,
//                 ],
//               ),
//               floating: true,
//             )
//           ],
//           body: const Text("data")
//         ),







// LimitedBox(
//                             child: Container(
                              // width: 170,
                              // height: 50,
                              // alignment: Alignment.topRight,
                              // padding: const EdgeInsets.all(10),
                              // decoration: BoxDecoration(
                              //     color: Colors.white,
                              //     boxShadow: [
                              //       BoxShadow(
                              //           blurRadius: 10,
                              //           spreadRadius: 5,
                              //           color: Colors.black.withOpacity(.1)),
                              //     ],
                              //     borderRadius: const BorderRadius.all(
                              //         Radius.circular(35))),
//                               child: GestureDetector(
//                                 onTap: () {
//                                   addDevice(context);
//                                 },
//                                 child: Row(
//                                   children: [
//                                     Image.asset(
//                                       'lib/icons/add.png',
//                                       height: 50,
//                                       color: Colors.grey[800],
//                                     ),
//                                     const SizedBox(
//                                       width: 5,
//                                     ),
//                                     Text(
//                                       "Add device",
//                                       style: GoogleFonts.poppins(
//                                           fontSize: 20,
//                                           color: Colors.grey.shade800),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),












        // onLongPress: () {
                            //   log("LongPress");
                            //   AwesomeDialog(
                            //     dialogBackgroundColor: Colors.white,
                            //     context: context,
                            //     dismissOnTouchOutside: false,
                            //     dismissOnBackKeyPress: false,
                            //     dialogType: DialogType.noHeader,
                            //     headerAnimationLoop: true,
                            //     animType: AnimType.scale,
                            //     body: Column(
                            //       crossAxisAlignment: CrossAxisAlignment.center,
                            //       children: [
                            //         Text("${duration.inSeconds}"),
                            //       ],
                            //     ),
                            //     buttonsTextStyle:
                            //         const TextStyle(color: Colors.black),
                            //     btnCancelText: "Leave",
                            //     btnOkText: "Cancel",
                            //     buttonsBorderRadius: const BorderRadius.only(
                            //         topLeft: Radius.circular(15),
                            //         bottomRight: Radius.circular(15)),
                            //     reverseBtnOrder: true,
                            //     barrierColor: Colors.black54,
                            //     btnCancelColor: Colors.grey.shade100,
                            //     btnOkColor: Colors.redAccent.shade100,
                            //     btnOkOnPress: () {
                            //       // Timer.periodic(const Duration(minutes: 1),
                            //       //     (timer) {
                            //       //   if (setTimer > 0) {
                            //       //     setState(() {
                            //       //       setTimer--;
                            //       //     });
                            //       //   } else {
                            //       //     timer.cancel();
                            //       //   }
                            //       // });
                            //     },
                            //     btnCancelOnPress: () {
                            //       return;
                            //     },
                            //   ).show();
                            // },








 // countDown = timeCheck == "min" || timeCheck == "mins"
    // ? Duration(minutes: setTimer)
    // : Duration(hours: setTimer);
    // resetTimer();
  //   super.initState();
  // }

  // // void startTimer({bool reset = true})
  // void startTimer() {
  //   // if (reset) {
  //   //   resetTimer();
  //   // }
  //   timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  // }

  // void resetTimer() {
  //   if (isCount) {
  //     setState(() => duration = timeCheck == "min" || timeCheck == "mins"
  //         ? Duration(minutes: setTimer)
  //         : Duration(hours: setTimer));
  //   } else {
  //     setState(() => duration = const Duration());
  //   }
  // }

  // void addTime() {
  //   // final add = isCount ? -1 : 1;
  //   const decrease = -1;
  //   setState(() {
  //     final seconds = duration.inSeconds + decrease;
  //     if (seconds < 0) {
  //       timer?.cancel();
  //     } else {
  //       duration = Duration(seconds: seconds);
  //     }
  //   });
  // }
  // void stopTimer({bool reset = true}) {
  //   if (reset) {
  //     resetTimer();
  //   }
  //   setState(() {
  //     timer?.cancel();
  //   });
  // }











//   import 'dart:async';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
// import 'package:flutter_icons/flutter_icons.dart';
// import 'package:marquee/marquee.dart';
// import 'package:wave_progress_widget/wave_progress.dart';
// import './dht.dart';
// class SinglePageApp extends StatefulWidget {
//   @override
//   _SinglePageAppState createState() => _SinglePageAppState();
// }
// class _SinglePageAppState extends State<SinglePageApp>
//     with SingleTickerProviderStateMixin {
//   TabController _tabController;
//   int tabIndex = 0;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   DatabaseReference _dhtRef =
//       FirebaseDatabase.instance.reference().child('DHT');
//   bool _signIn;
//   String heatIndexText;
//   Timer _timer;
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//     _signIn = false;
//     heatIndexText = "Showing Heat Index Here Soon ...";
//     _timer = Timer.periodic(Duration(seconds: 10), (timer) {
//       if (_signIn) {
//         setState(() {});
//       }
//     });
//     _signInAnonymously();
//   }
//   @override
//   void dispose() {
//     _tabController.dispose();
//     _timer.cancel();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return _signIn ? mainScaffold() : signInScaffold();
//  }
//  Widget mainScaffold() {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("FIREBASE REALTIME DB"),
//         bottom: TabBar(
//           controller: _tabController,
//           onTap: (int index) {
//             setState(() {
//               tabIndex = index;
//             });
//           },
//           tabs: [
//             Tab(
//               icon: Icon(MaterialCommunityIcons.temperature_fahrenheit),
//             ),
//             Tab(
//               icon: Icon(MaterialCommunityIcons.water_percent),
//             )
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           Container(
//             height: 30,
//             child: _buildMarquee(),
//           ),
//           Expanded(
//             child: StreamBuilder(
//                 stream: _dhtRef.onValue,
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData &&
//                       !snapshot.hasError &&
//                       snapshot.data.snapshot.value != null) {
//                     var _dht =
//                         DHT.fromJson(snapshot.data.snapshot.value['Json']);
//                     print(
//                         "DHT: ${_dht.temp} / ${_dht.humidity} / ${_dht.heatIndex}");
//                     _setMarqueeText(_dht);
//                     return IndexedStack(
//                       index: tabIndex,
//                       children: [
//                         _temperatureLayout(_dht),
//                         _humidityLayout(_dht)
//                       ],
//                     );
//                   } else {
//                     return Center(
//                       child: Text("NO DATA YET"),
//                     );
//                   }
//                 }),
//           ),
//         ],
//       ),
//     );
//   }
//   Widget _temperatureLayout(DHT _dht) {
//     return Center(
//         child: Column(
//       children: [
//         Container(
//           padding: const EdgeInsets.only(top: 40),
//           child: Text(
//             "TEMPERATURE",
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//           ),
//         ),
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 20),
//             child: FAProgressBar(
//               progressColor: Colors.green,
//               direction: Axis.vertical,
//               verticalDirection: VerticalDirection.up,
//               size: 100,
//               currentValue: _dht.temp.round(),
//               changeColorValue: 100,
//               changeProgressColor: Colors.red,
//               maxValue: 150,
//               displayText: "°F",
//               borderRadius: 16,
//               animatedDuration: Duration(milliseconds: 500),
//             ),
//           ),
//         ),
//         Container(
//           padding: const EdgeInsets.only(bottom: 40),
//           child: Text(
//             "${_dht.temp.toStringAsFixed(2)} °F",
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
//           ),
//         )
//       ],
//     ));
//   }
//   Widget _humidityLayout(DHT _dht) {
//     return Center(
//         child: Column(
//       children: [
//         Container(
//           padding: const EdgeInsets.only(top: 40),
//           child: Text(
//             "HUMIDITY",
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//           ),
//         ),
//         Expanded(
//           child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 50),
//               child: WaveProgress(
//                   180.0, Colors.blue, Colors.blueAccent, _dht.humidity)),
//         ),
//         Container(
//           padding: const EdgeInsets.only(bottom: 40),
//           child: Text(
//             "${_dht.humidity.toStringAsFixed(2)} %",
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
//           ),
//         )
//       ],
//     ));
//   }
//   _setMarqueeText(DHT _dht) {
//     heatIndexText = "Heat Index: ${_dht.heatIndex.toStringAsFixed(2)} °F, ";
//     if (_dht.heatIndex > 80 && _dht.heatIndex <= 90) {
//       heatIndexText +=
//           "Caution: fatigue is possible with prolonged exposure and activity. Continuing activity could result in heat cramps. ";
//     } else if (_dht.heatIndex > 90 && _dht.heatIndex <= 105) {
//       heatIndexText +=
//           "Extreme caution: heat cramps and heat exhaustion are possible. Continuing activity could result in heat stroke. ";
//     } else if (_dht.heatIndex > 105 && _dht.heatIndex <= 130) {
//       heatIndexText +=
//           "Danger: heat cramps and heat exhaustion are likely; heat stroke is probable with continued activity. ";
//     } else if (_dht.heatIndex > 130) {
//       heatIndexText += "Extreme danger: heat stroke is imminent. ";
//     } else {
//       heatIndexText += "Normal. ";
//     }
//   }
//   Widget _buildMarquee() {
//     return Marquee(
//       text: heatIndexText,
//       style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
//     );
//   }

//   Widget signInScaffold() {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "SIMPLE FIREBASE FLUTTER APP",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//             ),
//             SizedBox(
//               height: 50,
//             ),
//             RaisedButton(
//               textColor: Colors.white,
//               color: Colors.red,
//               shape: new RoundedRectangleBorder(
//                   borderRadius: new BorderRadius.circular(20),
//                   side: BorderSide(color: Colors.red)),
//               onPressed: () async {
//                 _signInAnonymously();
//               },
//               child: Text(
//                 "ANONYMOUS SIGN-IN",
//                 style: TextStyle(fontSize: 14),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//   void _signInAnonymously() async {
//     final FirebaseUser user = (await _auth.signInAnonymously()).user;
//     print("*** user isAnonymous: ${user.isAnonymous}");
//     print("*** user uid: ${user.uid}");
//     setState(() {
//       if (user != null) {
//         _signIn = true;
//       } else {
//         _signIn = false;
//       }
//     });
//   }
// }


















// class DHT {
//   final double temp;
//   final double humidity;
//   final double heatIndex;
//   DHT({this.temp, this.humidity, this.heatIndex});
//   factory DHT.fromJson(Map<dynamic, dynamic> json) {
//     double parser(dynamic source) {
//       try {
//         return double.parse(source.toString());
//       } on FormatException {
//         return -1;
//       }
//     }
//     return DHT(
//         temp: parser(json['temp']),
//         humidity: parser(json['hum']),
//         heatIndex: parser(json['ht']));
//   }
// }














// void signIn() async {
//     // try {
//     //   final account = await _googleSignIn.signInSilently();
//     //   print('User signed in: ${account?.displayName}');
//     // } on PlatformException catch (e) {
//     //   // User not signed in yet. Do something appropriate.
//     //   print("The user is not signed in yet. Asking to sign in.");
//     //   _googleSignIn.signIn();
//     // }
//     try {
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//       if (googleUser != null) {
//         // User signed in successfully
//         print('User signed in: ${googleUser.email}');
//         print('User signed in: ${googleUser.displayName}');
//         print('User signed in: ${googleUser.photoUrl}');
//         setState(() {
//           _currentUser = googleUser;
//           check = true;
//         });
//         if (user != null) {
//           Navigator.of(context).pushReplacement(MaterialPageRoute(
//             builder: (context) => HomePage(),
//           ));
//         }
//       } else {
//         // User cancelled sign-in flow
//         print('User cancelled sign-in.');
//       }
//     } on PlatformException catch (error) {
//       // Handle sign-in errors
//       print('Error signing in: $error');
//       _googleSignIn.signInSilently();
//     }
//   }











// EasyLoading.show(status: 'loading...');

// EasyLoading.showProgress(0.3, status: 'downloading...');

// EasyLoading.showSuccess('Great Success!');

// EasyLoading.showError('Failed with Error');

// EasyLoading.showInfo('Useful Information.');

// EasyLoading.showToast('Toast');

// EasyLoading.dismiss();




// import 'package:flutter_email_sender/flutter_email_sender.dart';
//  EasyLoading.show(status: "Sending query...");
//                         final Email send_email = Email(
//                           body: _controller.text.toString(),
//                           subject: 'Ask by User',
//                           recipients: ['jotinhirom000@gmail.com'],
//                           // cc: ['example_cc@ex.com'],
//                           // bcc: ['example_bcc@ex.com'],
//                           // attachmentPaths: ['/path/to/email_attachment.zip'],
//                           isHTML: false,
//                         );
//                         String platformResponse;

//                         try {
//                           await FlutterEmailSender.send(send_email);
//                           platformResponse = 'success';
//                         } catch (error) {
//                           print(error);
//                           platformResponse = error.toString();
//                         }
//                         log(platformResponse);
//                         if (!mounted) return;

//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text(platformResponse),
//                           ),
//                         );

//                         try {
//                           await FlutterEmailSender.send(send_email);
//                           EasyLoading.showSuccess('Query sent successfully.');
//                         } catch (e) {
//                           log(e.toString());
//                           EasyLoading.showError("Can't send the query.");
//                         }









// Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 children: [
//                   Center(
//                       child: textWidget(
//                           text: "Table of Sensors",
//                           fontWeight: FontWeight.bold,
//                           fontSize: 30)),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Column(
//                           children: [
//                             ...List.generate(
//                               sensor.listKeys.length,
//                               (index) => Padding(
//                                 padding: const EdgeInsets.all(10.0),
//                                 child: Column(
//                                   children: [
//                                     Center(
//                                       child: textWidget(
//                                           text: sensor.listKeys[index]
//                                               .toString()),
//                                     ),
//                                     Table(
//                                       border: TableBorder.all(
//                                           color: Colors.grey,
//                                           borderRadius:
//                                               BorderRadius.circular(20)),
//                                       defaultVerticalAlignment:
//                                           TableCellVerticalAlignment.middle,
//                                       children: [
//                                         ...List.generate(
//                                             1,
//                                             (index) => TableRow(
//                                                     decoration: BoxDecoration(
//                                                         color:
//                                                             Colors.blueAccent,
//                                                         borderRadius: index != 1
//                                                             ? BorderRadius.only(
//                                                                 topLeft: Radius
//                                                                     .circular(
//                                                                         20),
//                                                                 topRight:
//                                                                     Radius.circular(
//                                                                         20))
//                                                             : BorderRadius.only(
//                                                                 bottomLeft:
//                                                                     Radius.circular(
//                                                                         20),
//                                                                 bottomRight:
//                                                                     Radius.circular(
//                                                                         20))),
//                                                     children: [
//                                                       TableCell(
//                                                           verticalAlignment:
//                                                               TableCellVerticalAlignment
//                                                                   .middle,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                     .all(10.0),
//                                                             child: Center(
//                                                               child: textWidget(
//                                                                   text: sensor
//                                                                       .listValues[
//                                                                           index]
//                                                                       .toString()),
//                                                             ),
//                                                           )),
//                                                     ]))
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       Center(
//                         child: DataTable(
//                             sortAscending: true,
//                             sortColumnIndex: 0,
//                             columns: [
//                               DataColumn(label: Text("Sensor's Data")),
//                               DataColumn(label: Text("Value"))
//                             ],
//                             rows: [
//                               // ...List.generate(
//                               //   sensor.listValues.length,
//                               //   (index) => DataRow(cells: [
//                               //   ])
//                               // ),
//                               DataRow(cells: [
//                                 DataCell(Text("H")),
//                                 DataCell(Text("50"))
//                               ]),
//                               DataRow(cells: [
//                                 DataCell(Text("T")),
//                                 DataCell(Text("28"))
//                               ]),
//                               DataRow(cells: [
//                                 DataCell(Text("A")),
//                                 DataCell(Text("50"))
//                               ]),
//                               DataRow(cells: [
//                                 DataCell(Text("I")),
//                                 DataCell(Text("28"))
//                               ])
//                             ]),
//                       )
//                     ],
//                   )
//                 ],
//               )),



  // Expanded(
                        //   child: AnimSearchBar(
                        //     width: 400,
                        //     textController: searchController,
                        //     onSuffixTap: () {
                        //       debugPrint("anime press");
                        //       setState(() {
                        //         searchController.clear();
                        //       });
                        //     },
                        //     onSubmitted: (String searchController) {
                        //       log(searchController);
                        //       // if (searchController.isEmpty) {
                        //       //   debugPrint("Enter something in search bar");
                        //       // } else {
                        //       //   try {
                        //       //     searchList = deviceNames
                        //       //         .where((element) =>
                        //       //             element.contains(searchController))
                        //       //         .toList();
                        //       //   } catch (e) {
                        //       //     ScaffoldMessenger.of(context).showSnackBar(
                        //       //         const SnackBar(content: Text("Not Found")));
                        //       //   }
                        //       setState(() {
                        //         // deviceNames = searchList;
                        //         controller.clear();
                        //       });
                        //     },
                        //   ),
                        // ),




                        
// EasyLoading.show(status: "Sending query...");
//                         final Email send_email = Email(
//                           body: _controller.text.toString(),
//                           subject: 'Ask by User',
//                           recipients: ['jotinhirom000@gmail.com'],
//                           // cc: ['example_cc@ex.com'],
//                           // bcc: ['example_bcc@ex.com'],
//                           // attachmentPaths: ['/path/to/email_attachment.zip'],
//                           isHTML: false,
//                         );
//                         String platformResponse;

//                         try {
//                           await FlutterEmailSender.send(send_email);
//                           platformResponse = 'success';
//                         } catch (error) {
//                           print(error);
//                           platformResponse = error.toString();
//                         }
//                         log(platformResponse);
//                         if (!mounted) return;

//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text(platformResponse),
//                           ),
//                         );

//                         try {
//                           await FlutterEmailSender.send(send_email);
//                           EasyLoading.showSuccess('Query sent successfully.');
//                         } catch (e) {
//                           log(e.toString());
//                           EasyLoading.showError("Can't send the query.");
//                         }





  // final response =
                          //     await sendEmail(message: _controller.value.text);
                          // // ignore: use_build_context_synchronously
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   response == 200
                          //       ? const SnackBar(
                          //           content: Text('Message Sent!'),
                          //           backgroundColor: Colors.green)
                          //       : const SnackBar(
                          //           content: Text('Failed to send message!'),
                          //           backgroundColor: Colors.red),
                          // );

                            // Future sendEmail({required String message}) async {
  //   // EasyLoading.show(status: "Sending...");
  //   const serviceID = "service_nxwaj89";
  //   const templateID = "template_p1niott";
  //   const userID = "eY36LUJnTBCDYknuD";
  //   final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
  //   final response = await http.post(url,
  //       headers: {
  //         'Content-Type': 'application/json'
  //       }, //This line makes sure it works for all platforms.
  //       body: json.encode({
  //         'service_id': serviceID,
  //         'template_id': templateID,
  //         'key': userID,
  //         'template_params': {
  //           'user_name': widget.name,
  //           'user_email': widget.email,
  //           'user_subject': "Feedback from user",
  //           'user_message': message
  //         }
  //       }));
  //   // EasyLoading.showSuccess('Sent successfully.');
  //   // ignore: avoid_print
  //   print(response.body);
  // }