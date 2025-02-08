import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smarthomeui/widgets/text_widget.dart';

// ignore: must_be_immutable
class SensorTable extends StatefulWidget {
  SensorTable({super.key, required this.name});
  String name;
  @override
  State<SensorTable> createState() => _SensorTableState();
}

class _SensorTableState extends State<SensorTable> {
  List list = [];
  List sensorsKeys = [];
  List sensorsValues = [];
  Map<dynamic, dynamic> sensorsMap = {};
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: textWidget(
            text: "Sensor's Table", fontWeight: FontWeight.bold, fontSize: 25),
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
          padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
          child: StreamBuilder<DatabaseEvent>(
            stream: FirebaseDatabase.instance
                .ref()
                .child(widget.name)
                .child("Sensors")
                .onValue,
            builder: (context, snapshot) {
              List keys = [];
              List values = [];
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  // ignore: unnecessary_null_comparison
                  if (snapshot.data!.snapshot.value == null) {
                    return Column(
                      children: [
                        Lottie.asset(
                          "assets/lottie/no-data.json",
                          repeat: false,
                          animate: true,
                          fit: BoxFit.cover,
                        )
                      ],
                    );
                  } else {
                    sensorsMap = snapshot.data?.snapshot.value as dynamic;
                    log(sensorsMap.toString());
                    sensorsKeys = sensorsMap.keys.toList();
                    sensorsValues = sensorsMap.values.toList();
                    Map data = {};
                    data.clear();
                    // ignore: avoid_function_literals_in_foreach_calls
                    sensorsValues.forEach((element) {
                      data.addAll(element);
                      keys = data.keys.toList();
                      values = data.values.toList();
                    });
                    return Center(
                        child: DataTable(
                            border: TableBorder.all(
                                borderRadius: BorderRadius.circular(10)),
                            columns: [
                          DataColumn(
                              label: textWidget(
                                  text: "Sensor's Data",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                          DataColumn(
                              label: textWidget(
                                  text: "Value",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20))
                        ],
                            rows: [
                          ...List.generate(
                            keys.length,
                            (index) => DataRow(cells: [
                              DataCell(
                                  textWidget(text: keys[index].toString())),
                              DataCell(
                                  textWidget(text: values[index].toString()))
                            ]),
                          ),
                        ]));
                  }
                } else {
                  return Column(
                    children: [
                      Lottie.asset(
                        "assets/lottie/no-data.json",
                        repeat: false,
                        animate: true,
                        fit: BoxFit.cover,
                      )
                    ],
                  );
                }
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    textWidget(text: "Loading  ", fontSize: 20),
                    const CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  ],
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        )),
      ),
    );
  }
}
