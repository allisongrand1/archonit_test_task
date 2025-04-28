import 'package:flutter/material.dart';

enum AppThemeType { light, dark }

class AppThemes {
  static String fontFamily = 'SFProText';

  static ThemeData createTheme(AppThemeType themeType) {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        brightness: themeType == AppThemeType.light ? Brightness.light : Brightness.dark,
      ),
      fontFamily: fontFamily,
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          color: Color(0xFF17171A),
          fontSize: 17,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.41,
          height: 1.5,
        ),
      ),
      useMaterial3: true,
    );
  }
}
