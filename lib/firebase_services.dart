import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';

class Services {
  final counterRef = FirebaseDatabase.instance.ref();
  List list = [];
  Map<String, dynamic> map = {};

  Future<void> readData(String name) async {
    counterRef.child(name).child("Sensors").onValue.listen((event) {
      map = event.snapshot.value as Map<String, dynamic>;
      list.add(map);
      log(list.toString());
    });
    // counterRef.onValue.listen((event) {
    //   for (var element in event.snapshot.children) {
    //     list.add(element.value);
    //   }
    //   log(list.toString());
    // });
  }

  // Future<void> delData() async {
  //   counterRef.child("Data").remove();
  // }
}
