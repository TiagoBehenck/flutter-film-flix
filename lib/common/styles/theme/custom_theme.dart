import 'package:filme_flix/common/styles/theme/custom_color_scheme.dart';
import 'package:filme_flix/common/styles/theme/custom_text_theme.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get theme {
    return ThemeData(
      textTheme: CustomTextTheme.textTheme,
      colorScheme: CustomColorScheme.colorScheme,
    );
  }
}
