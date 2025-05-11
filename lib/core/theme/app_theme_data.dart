import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/app_light_color.dart';

abstract class AppThemeData {
  static final ThemeData lightThemeData = ThemeData(
    scaffoldBackgroundColor: AppLightColor.scaffoldBackground,
    fontFamily: "Lexend Deca",
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
  );
}
