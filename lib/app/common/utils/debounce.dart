// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

class Debounce {
  final Duration delay;
  VoidCallback? _action;
  Timer? _timer;

  Debounce({required this.delay});

  void call(VoidCallback action) {
    _action = action;

    if (_timer?.isActive ?? false) {
      _timer?.cancel();
    }

    _timer = Timer(delay, () => _action?.call());
  }
}
