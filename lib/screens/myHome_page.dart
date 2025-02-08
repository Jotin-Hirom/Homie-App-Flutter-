// ignore_for_file: file_names
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   TextEditingController controller = TextEditingController();
//   bool data = false;
//   bool value = false;
//   final counterRef = FirebaseDatabase.instance.ref();
//   final database = FirebaseDatabase.instance;
//   Map<dynamic, dynamic> map = {};
//   Map<dynamic, dynamic> a = {};
//   List list = [];
//   void onUpdate() {
//     setState(() {
//       value = !value;
//     });
//   }

//   Future<void> setData() async {
//     // await counterRef.child("Data").set({"Temperature": 0, "Humidity": 0});
//     await counterRef.child("LightState").set({"switch": value});
//   }

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

//   @override
//   void initState() {
//     readData();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//       child: Column(
//         children: [
//           Padding(
//               padding: const EdgeInsets.all(18),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Icon(Icons.clear_all),
//                   const Text(
//                     "My Room",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   Icon(
//                     Icons.settings,
//                     color: !value ? Colors.white : Colors.yellow,
//                   ),
//                 ],
//               )),
//           const SizedBox(
//             height: 30,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("Temperature",
//                         style: TextStyle(
//                             color: !value ? Colors.white : Colors.yellow,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold)),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text('${map["Temperature"].toString()}°C',
//                         style:
//                             const TextStyle(color: Colors.white, fontSize: 20)),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("Humidity",
//                         style: TextStyle(
//                             color: !value ? Colors.white : Colors.yellow,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold)),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(map["Humidity"].toString() + "°C",
//                         style:
//                             const TextStyle(color: Colors.white, fontSize: 20)),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   FloatingActionButton.extended(
//                     onPressed: () async {
//                       onUpdate();
//                       await setData();
//                     },
//                     icon: value
//                         ? Icon(Icons.visibility)
//                         : Icon(Icons.visibility_off),
//                     backgroundColor: value ? Colors.yellow : Colors.white,
//                     elevation: 20.00,
//                     label: Text(value ? "On" : "Off"),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           Container(
//             width: 50,
//             height: 50,
//             child: TextField(
//               decoration: const InputDecoration(
//                   hintText: "Enter ",
//                   hintStyle: TextStyle(color: Colors.white)),
//               controller: controller,
//             ),
//           ),
//           IconButton(
//               onPressed: () async {
//                 String temp = controller.text.trim();
//                 if (temp != null) {
//                   await counterRef.child(temp).set({});
//                 }
//                 return;
//               },
//               icon: const Icon(Icons.send)),
//           // DropdownButton(
//           //   items: items,
//           //   onChanged: (value) {},
//           // )
//         ],
//       ),
//       // Center(
//       //   child: Column(
//       //     mainAxisAlignment: MainAxisAlignment.center,
//       //     children: <Widget>[
//       //       CupertinoButton(
//       //         onPressed: () {
//       //           counterRef.child("Light").set({"Switch": !data});
//       //           setState(() {
//       //             data = !data;
//       //           });
//       //         },
//       //         child: Text(data ? "on" : "off"),
//       //       ),
//       //     ],
//       //   ),
//       // ),
//     ));
//   }
// }




//  AnimatedSplashScreen(
//           centered: true,
//           duration: 2000,
//           splash: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Lottie.asset(
//               "assets/lottie/78499-smart-appliances.json",
//               fit: BoxFit.contain,
//               // height: 400,
//               // width: 400,
//             ),
//           ),
//           splashTransition: SplashTransition.slideTransition,
//           pageTransitionType: PageTransitionType.fade,
          // nextScreen: FirebaseAuth.instance.currentUser != null
          //     ? HomePage(
          //         displayName:
          //             FirebaseAuth.instance.currentUser!.displayName.toString(),
          //         email: FirebaseAuth.instance.currentUser!.email.toString(),
          //         photoURL:
          //             FirebaseAuth.instance.currentUser!.photoURL.toString(),
          //       )
          //     : const LoginScreen());


//Line Chart
// const SizedBox(height: 10),
                    // SfCartesianChart(
                    //     series: <LineSeries<LiveData, int>>[
                    //       LineSeries<LiveData, int>(
                    //         onRendererCreated:
                    //             (ChartSeriesController controller) {
                    //           _chartSeriesController = controller;
                    //         },
                    //         dataSource: chartData,
                    //         color: const Color.fromRGBO(192, 108, 132, 1),
                    //         xValueMapper: (LiveData sales, _) => sales.time,
                    //         yValueMapper: (LiveData sales, _) => sales.speed,
                    //       )
                    //     ],
                    //     primaryXAxis: NumericAxis(
                    //         majorGridLines: const MajorGridLines(width: 0),
                    //         edgeLabelPlacement: EdgeLabelPlacement.shift,
                    //         interval: 3,
                    //         title: AxisTitle(text: 'Time (minutes)')),
                    //     primaryYAxis: NumericAxis(
                    //         axisLine: const AxisLine(width: 0),
                    //         majorTickLines: const MajorTickLines(size: 0),
                    //         title: AxisTitle(text: 'Humidity (%)'))),


  // int time = 19;
  // void updateDataSource(Timer timer) {
  //   chartData.add(LiveData(time++, (math.Random().nextInt(60) + 30)));
  //   chartData.removeAt(0);
  //   _chartSeriesController.updateDataSource(
  //       addedDataIndex: chartData.length - 1, removedDataIndex: 0);
  // }


//   List<LiveData> getChartData() {
//     return <LiveData>[
//       LiveData(0, 42),
//       LiveData(1, 47),
//       LiveData(2, 43),
//       LiveData(3, 49),
//       LiveData(4, 54),
//       LiveData(5, 41),
//       LiveData(6, 58),
//       LiveData(7, 51),
//       LiveData(8, 98),
//       LiveData(9, 41),
//       LiveData(10, 53),
//       LiveData(11, 72),
//       LiveData(12, 86),
//       LiveData(13, 52),
//       LiveData(14, 94),
//       LiveData(15, 92),
//       LiveData(16, 86),
//       LiveData(17, 72),
//       LiveData(18, 94)
//     ];
//   }


// class LiveData {
//   LiveData(this.time, this.speed);
//   final int time;
//   final num speed;
// }




// import 'package:syncfusion_flutter_charts/charts.dart';
//   List<SalesData> getChartData() {
//     final List<SalesData> chartData = [
//       SalesData(2017, 25),
//       SalesData(2018, 12),
//       SalesData(2019, 24),
//       SalesData(2020, 18),
//       SalesData(2021, 30)
//     ];
//     return chartData;
//   }
// }

// class SalesData {
//   SalesData(this.year, this.sales);
//   final double year;
//   final double sales;
// }

  // late List<SalesData> _chartData;
  // late TooltipBehavior _tooltipBehavior;

  // @override
  // void initState() {
  //   // _chartData = getChartData();
  //   // _tooltipBehavior = TooltipBehavior(enable: true);
  //   super.initState();
  // }


      //         body: SfCartesianChart(
      //   title: ChartTitle(text: 'Yearly sales analysis',textStyle: GoogleFonts.poppins(color: Colors.black)),
      //   legend: Legend(isVisible: true),
      //   tooltipBehavior: _tooltipBehavior,
      //   series: <ChartSeries>[
      //     LineSeries<SalesData, double>(
      //         name: 'Sales',
      //         dataSource: _chartData,
      //         xValueMapper: (SalesData sales, _) => sales.year,
      //         yValueMapper: (SalesData sales, _) => sales.sales,
      //         dataLabelSettings: const DataLabelSettings(isVisible: true),
      //         enableTooltip: true)
      //   ],
      //   primaryXAxis: NumericAxis(
      //     edgeLabelPlacement: EdgeLabelPlacement.shift,
      //   ),
      //   primaryYAxis: NumericAxis(
      //       labelFormat: '{value}M',
      //       labelStyle: GoogleFonts.poppins(color: Colors.black)
      //       // numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0)
      //       ),
      // )