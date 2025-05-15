// Dart imports:
import 'dart:developer';

// Flutter imports:
import 'package:flutter/foundation.dart';

abstract class AppError implements Exception {
  final String? message;
  final StackTrace stackTrace;
  final Object? error;

  AppError({required this.stackTrace, this.message, this.error}) {
    if (kDebugMode) {
      log('StackTrace: $stackTrace || error: $error');
    }
  }
}

class SerializerError extends AppError {
  SerializerError({
    required super.stackTrace,
    super.message,
    required super.error,
  });
}

class NetworkError extends AppError {
  NetworkError({
    required super.stackTrace,
    super.error,
    super.message,
  });
}
