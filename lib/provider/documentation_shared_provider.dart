import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarthomeui/firebase_services.dart';

class Documentation with ChangeNotifier {
  SharedPreferences? _preferences;

  Map<dynamic, dynamic> _map = {};
  Map<dynamic, dynamic> get map => _map;

  String _resultString = '';
  String get resultString => _resultString;

  String _textString = 'Can\'t get the data.';
  String get textString => _textString;

  _initialization() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  void loadSetting({required String name}) async {
    await _initialization();
    _call(name);
    notifyListeners();
  }

  void _call(String name) async {
    Services().counterRef.child(name).onValue.listen((event) {
      if (event.snapshot.value == null) {
        _textString = "Database reference is empty.";
        return;
      }
      _map = event.snapshot.value as Map<dynamic, dynamic>;
      if (_map.isEmpty) {
        _textString = "No ref has been found.";
        return;
      } else {
        _preferences!.setString("mapString", map.toString());
        _resultString = _preferences!.getString("mapString") ?? "";
      }
    });
    notifyListeners();
  }
}
