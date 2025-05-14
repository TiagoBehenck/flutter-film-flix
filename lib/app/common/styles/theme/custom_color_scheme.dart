// Flutter imports:
import 'package:flutter/material.dart';

class CustomColorScheme {
  static ColorScheme get colorScheme {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff32A873),
      onPrimary: Color(0xff121212),
      secondary: Colors.transparent,
      onSecondary: Color(0xff32A873),
      error: Colors.red,
      onError: Colors.white,
      surface: Color(0xff121212),
      onSurface: Colors.white,
    );
  }
}
