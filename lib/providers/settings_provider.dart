import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  bool _darkMode = false;
  int darkModeColor = Colors.yellow.value;
  SharedPreferences? prefs;

  bool get darkMode => _darkMode;

  void toggleMode() {
    _darkMode = !_darkMode;
    if (prefs != null) {
      prefs!.setBool('darkMode', _darkMode);
    }

    notifyListeners();
  }

  void setSeedColor(Color color) {
    darkModeColor = color.value;
    if (prefs != null) {
      prefs!.setInt('darkModeColor', darkModeColor);
    }
    notifyListeners();
  }

  SettingsProvider() {
    initPreferences();
  }

  void initPreferences() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs != null) {
      _darkMode = prefs!.getBool('darkMode') ?? false;
      darkModeColor = prefs!.getInt('darkModeColor') ?? Colors.yellow.value;
    }
    notifyListeners();
  }
}
