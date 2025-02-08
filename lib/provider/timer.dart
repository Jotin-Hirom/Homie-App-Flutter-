import 'dart:async';
import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';

class TimerProvider with ChangeNotifier {
  Map<dynamic, dynamic> map = {};
  Timer? _timer;
  // ignore: prefer_final_fields
  int _hour = 0;
  // ignore: prefer_final_fields
  int _minute = 0;
  int _seconds = 0;
  int _counting = 0;

  int _setTimer = 0;
  var _timerHands = "";

  // bool _startEnable = true;
  // bool _stopEnable = false;
  // bool _continueEnable = false;

  bool _isCount = true;
  bool _isSet = false;

  String _connection = "false";

  String get connection => _connection;

  int get hour => _hour;
  int get minute => _minute;
  int get seconds => _seconds;
  int get counting => _counting;
  Timer? get timer => _timer;
  // bool get startEnable => _startEnable;
  // bool get stopEnable => _stopEnable;
  // bool get continueEnable => _continueEnable;

  bool get isCount => _isCount;
  bool get isSet => _isSet;

  int get setTimer => _setTimer;
  get timerHands => _timerHands;

  int _temperature = 23;
  int get temperature => _temperature;

  void updateTemp(double temp) {
    _temperature = temp.toInt();
    notifyListeners();
  }

  Duration duration = const Duration();

  void changeAlertDialog() {
    _isSet = true;
    _isCount = true;
    notifyListeners();
  }

  connectionCheck(String name) async {
    EasyLoading.show(status: "Checking...");
    await FirebaseDatabase.instance
        .ref()
        .child(name)
        .child("Connection")
        .once()
        .then((event) {
      log(event.snapshot.value.toString());
      // ignore: unnecessary_null_comparison
      if (event.snapshot.value == null) {
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
    });
    EasyLoading.dismiss();
    notifyListeners();
    return Future.delayed(const Duration(seconds: 2));
  }

  void uploadTime({required String name, required String deviceName}) async {
    EasyLoading.show(
      // ignore: unnecessary_brace_in_string_interps
      status: "Time setting for ${deviceName}...",
    );
    duration = _timerHands == "min" || _timerHands == "mins"
        ? Duration(minutes: setTimer)
        : Duration(hours: setTimer);

    _seconds = duration.inSeconds;

    try {
      await FirebaseDatabase.instance
          .ref()
          .child(name)
          .child("Devices")
          .child(deviceName)
          .update({
        "start": _seconds,
        "counting": _seconds,
        "end": 0,
        "isSet": true,
        "isCount": true,
      });
    } catch (e) {
      debugPrint(e.toString());
    }
    //fetch doing....
    readDevices(name: name, deviceName: deviceName);
    //int endTime =
    EasyLoading.dismiss();
    notifyListeners();
  }

  void startTimer(String name, String deviceName) async {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (_counting <= map["end"]) {
        stopTimer(deviceName: deviceName,name:  name);
      } else {
        _counting--;
        try {
          await FirebaseDatabase.instance
              .ref()
              .child(name)
              .child("Devices")
              .child(deviceName)
              .update({
            "counting": _seconds,
          });
        } catch (e) {
          debugPrint(e.toString());
        }
      }
      notifyListeners();
    });
  }

  void updateTime(int x, var y) {
    _setTimer = x;
    _timerHands = y;
    notifyListeners();
  }

  void stopTimer({required String name,required String deviceName}) async {
    try {
      await FirebaseDatabase.instance
          .ref()
          .child(name) 
          .child("Devices")
          .child(deviceName)
          .update({
        "start": 0,
        "end": 0,
        "counting": 0,
        "isCount": false,
        "isSet": false,
        "switch": false
      });
    } catch (e) {
      debugPrint(e.toString());
    }
    // _isSet = false;
    // _isCount = false;
    duration = const Duration();
    _timer!.cancel();
    notifyListeners();
  }

  Future<void> readDevices(
      {required String name, required String deviceName}) async {
    // log("read data");
    // ignore: await_only_futures
    await FirebaseDatabase.instance
        .ref()
        .child(name)
        .child("Devices")
        .child(deviceName)
        .onValue
        .listen((event) {
      map = event.snapshot.value as Map<dynamic, dynamic>;
      _counting = map["start"];
      log(_counting.toString());
      log(map.toString());
    });
  }

  Future<void> readSensors(String name) async {
    log("read sensors");
    // ignore: await_only_futures
    await FirebaseDatabase.instance
        .ref()
        .child(name)
        .child("Sensors")
        .onValue
        .listen((event) {
      map = event.snapshot.value as Map<dynamic, dynamic>;
      log(map.toString());
    });
  }
}







// void subTime() {
//   const decrease = -1;
//   final seconds = duration.inSeconds + decrease;
//   log(seconds.toString());
//   if (seconds < 0) {
//     _timer?.cancel();
//   }
//   notifyListeners();
// }

// _timer = Timer.periodic(const Duration(seconds: 1), (_) {
//   log("message");
//   subTime();
// });
//DateTime.parse(formattedString) this is for conVERTING STRING TO DATE TIME

// void stopTimer() {
//   if (_startEnable == false) {
//     _startEnable = true;
//     // // _continueEnable = true;
//     // _stopEnable = false;
//     _isSet = false;
//     _isCount = false;
//     _timer!.cancel();
//   }
//   notifyListeners();
// }

// void continueTimer() {
//   _startEnable = false;
//   _stopEnable = true;
//   _continueEnable = false;

//   _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//     if (_seconds < 59) {
//       _seconds++;
//     } else if (_seconds == 59) {
//       _seconds = 0;
//       if (_minute == 59) {
//         _hour++;
//         _minute = 0;
//       } else {
//         _minute++;
//       }
//     }

//     notifyListeners();
//   });
// }
// }


    // await FirebaseDatabase.instance.ref().onValue.listen((event) {
    // map.addAll(event.snapshot as Map) as dynamic;
    // list.addAll(map as Iterable<Map>);
    // for (var element in list) {
    //   log(element.toString());
    // }
    // for (var element in event.snapshot.children) {
    //   list.add(element.value);
    // }
    // log(list.toString());
    // log(event.snapshot.toString());
    // });

    // EasyLoading.show(
    //   status: 'Please wait...',
    // );
    // _hour = 0;
    // _minute = 0;
    // _seconds = 0;
    // _isCount = true;
    // // _startEnable = false;
    // // _stopEnable = true;
    // // _continueEnable = false;

    // // if (isCount) {
    // duration = _timerHands == "min" || _timerHands == "mins"
    //     ? Duration(minutes: setTimer)
    //     : Duration(hours: setTimer);

    // _seconds = duration.inSeconds;
    // // } else {
    // //   duration = const Duration();
    // // }

    // try {
    //   await FirebaseDatabase.instance
    //       .ref()
    //       .child(name)
    //       .child("Devices")
    //       .child(deviceName)
    //       .update({
    //     "start": _seconds,
    //     "counting": _seconds,
    //     "end": 0,
    //     "isSet": true,
    //     "isCount": true,
    //   });
    // } catch (e) {
    //   debugPrint(e.toString());
    // }

    // //fetch doing....
    // readData(name, deviceName);
    // //int endTime =
    // EasyLoading.dismiss();