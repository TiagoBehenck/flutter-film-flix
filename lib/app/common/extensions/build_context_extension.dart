// Flutter imports:
import 'package:flutter/material.dart';

extension SizeExtension on BuildContext {
  Size get mediaSize => MediaQuery.of(this).size;

  double get paddingTop => MediaQuery.of(this).padding.top;
  double get paddingBottom => MediaQuery.of(this).padding.bottom;

  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  double get heightWithoutPaddings => height - paddingTop - paddingBottom;

  double get screenShortestSide => MediaQuery.of(this).size.shortestSide;
  double get screenLongestSide => MediaQuery.of(this).size.longestSide;

  double percentWidth(double percent) => width * percent;
  double percentHeight(double percent) => height * percent;
}
