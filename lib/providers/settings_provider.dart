import 'package:flutter/material.dart';


class SettingsProvider extends ChangeNotifier {
  bool _darkMode = true;

  bool get darkMode => _darkMode;

  void toggleMode(){
    _darkMode = !_darkMode;
    notifyListeners();

  }
}


