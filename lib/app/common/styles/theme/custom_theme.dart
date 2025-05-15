// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:filme_flix/app/common/styles/theme/custom_color_scheme.dart';
import 'package:filme_flix/app/common/styles/theme/custom_text_theme.dart';

class CustomTheme {
  static ThemeData get theme {
    return ThemeData(
      textTheme: CustomTextTheme.textTheme,
      colorScheme: CustomColorScheme.colorScheme,
    );
  }
}
