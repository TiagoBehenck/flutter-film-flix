// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';

class CustomTextTheme {
  static TextTheme get textTheme { 
    return GoogleFonts.getTextTheme('Inter').apply(
      fontFamily: 'Inter',
      bodyColor: Colors.white,
      displayColor: Colors.white,
    );
  }
}
