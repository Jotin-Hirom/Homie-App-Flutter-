import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData light = ThemeData(
  brightness: Brightness.light,
  // primarySwatch: Colors.blue,
  scaffoldBackgroundColor: Colors.grey.shade100,
  // accentColor: Colors.lightBlueAccent,
);

ThemeData dark = ThemeData(
  brightness: Brightness.dark,
  // primarySwatch: Colors.blue,
  scaffoldBackgroundColor: Colors.black87,
  // accentColor: Colors.lightBlueAccent,
);

class ThemeSetting with ChangeNotifier {
  bool _darktheme = false;
  bool _load = false;
  SharedPreferences? _pref;
  bool get darktheme => _darktheme;
  bool get load => _load;

  set load(bool value) {
    _load = value;
    notifyListeners();
  }

  ThemeSetting() {
    _loadSetting();
  }

  _initialization() async {
    _pref ??= await SharedPreferences.getInstance();
  }

  _loadSetting() async {
    await _initialization();
    _darktheme = _pref?.getBool("darktheme") ?? false;
    notifyListeners();
  }

  _saveSetting() async {
    await _initialization();
    _pref?.setBool("darktheme", _darktheme);
  }

  toggle() {
    _darktheme = !_darktheme;
    _saveSetting();
    notifyListeners();
  }
}








            // theme: ThemeData(brightness: Brightness.dark),
            // theme: ThemeData.dark().copyWith(
            //   scaffoldBackgroundColor: Pallete.backgroundColor,
            // ),
            // themeMode: ThemeMode.dark,

                      // Consumer<ThemeSetting>(
              //   builder: (context, value, child) {
              //     return SwitchListTile(
              //       title: textWidget(text: "Dark Theme"),
              //       value: value.darktheme,
              //       onChanged: (v) {
              //         // context.read<ThemeSetting>().toggle();
              //         value.toggle();
              //       },
              //     );
              //   },
              // ),