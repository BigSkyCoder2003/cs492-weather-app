import 'package:flutter/material.dart';

ThemeData lightTheme(Color seedColor) => ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
      brightness: Brightness.light,
      useMaterial3: true,
    );

ThemeData darkTheme(Color seedColor) => ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor, brightness: Brightness.dark),
      useMaterial3: true,
    );

