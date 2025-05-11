import 'package:flutter/material.dart';

const String fontFamily = 'Inter'; 

class AppTextStyles {
  AppTextStyles._();

  // Heading styles
  /// The largest heading style
  /// - `fontSize` is `27` by default
  /// - `fontWeight` is `[FontWeight.bold]` by default
  /// - `color` is `Colors.white` by default
  static TextStyle get h1 => const TextStyle(
    fontFamily: fontFamily,
    fontSize: 27,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  /// The second largest heading style
  /// - `fontSize` is `24` by default
  /// - `fontWeight` is `[FontWeight.bold]` by default
  /// - `color` is `Colors.white` by default
  static TextStyle get h2 => const TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  /// The third largest heading style
  /// - `fontSize` is `20` by default
  /// - `fontWeight` is `[FontWeight.bold]` by default
  static TextStyle get h3 => const TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  /// The fourth largest heading style
  /// - `fontSize` is `18` by default
  /// - `fontWeight` is `[FontWeight.bold]` by default
  static TextStyle get h4 => const TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  /// The smallest heading style
  /// - `fontSize` is `16` by default
  /// - `fontWeight` is `[FontWeight.bold]` by default
  static TextStyle get h5 => const TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  // Body text styles
  /// Large body text style
  /// - `fontSize` is `16` by default
  /// - `fontWeight` is `[FontWeight.w500]` by default
  static TextStyle get bodyLarge => const TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  /// Medium body text style
  /// - `fontSize` is `15` by default
  /// - `fontWeight` is `[FontWeight.w400]` by default
  /// - `color` is `Colors.white` by default
  static TextStyle get bodyMedium => const TextStyle(
    fontFamily: fontFamily,
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  /// This is the default style for body text
  /// - `fontSize` is `14` by default
  /// - `fontWeight` is `[FontWeight.w400]` by default
  static TextStyle get bodySmall => const TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  // Caption styles
  /// Large caption text style
  /// - `fontSize` is `14` by default
  /// - `fontWeight` is `[FontWeight.w400]` by default
  /// - `color` is `Color(0xff969696)` by default
  static TextStyle get captionLarge => const TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    color: Color(0xff969696),
    fontWeight: FontWeight.w400,
  );

  /// Medium caption text style
  /// - `fontSize` is `13` by default
  /// - `fontWeight` is `[FontWeight.w400]` by default
  static TextStyle get captionMedium => const TextStyle(
    fontFamily: fontFamily,
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );

  /// Small caption text style
  /// - `fontSize` is `12` by default
  /// - `fontWeight` is `[FontWeight.w400]` by default
  /// - `color` is `Color(0xff969696)` by default
  static TextStyle get captionSmall => const TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    color: Color(0xff969696),
    fontWeight: FontWeight.w400,
  );

  // Button styles
  /// Large button text style
  /// - `fontSize` is `16` by default
  /// - `fontWeight` is `[FontWeight.bold]` by default
  /// - `color` is `Colors.white` by default
  static TextStyle get buttonLarge => const TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.bold
  );

  /// Medium button text style
  /// - `fontSize` is `14` by default
  /// - `fontWeight` is `[FontWeight.bold]` by default
  static TextStyle get buttonMedium => const TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  // Label styles
  /// Primary label text style
  /// - `fontSize` is `16` by default
  /// - `fontWeight` is `[FontWeight.w600]` by default
  static TextStyle get labelPrimary => const TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  /// Secondary label text style
  /// - `fontSize` is `16` by default
  /// - `fontWeight` is `[FontWeight.bold]` by default
  static TextStyle get labelSecondary => const TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  // Error styles
  /// Large error text style
  /// - `fontSize` is `24` by default
  /// - `fontWeight` is `[FontWeight.bold]` by default
  /// - `color` is `Colors.white` by default
  static TextStyle get errorLarge => const TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  /// Medium error text style
  /// - `fontSize` is `16` by default
  /// - `color` is `Colors.black54` by default
  static TextStyle get errorMedium => const TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    color: Colors.black54,
  );

  /// Small error text style
  /// - `fontSize` is `14` by default
  /// - `fontWeight` is `[FontWeight.w400]` by default
  /// - `color` is `Colors.grey[600]` by default
  static TextStyle get errorSmall => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    color: Colors.grey[600],
    fontWeight: FontWeight.w400,
  );
}