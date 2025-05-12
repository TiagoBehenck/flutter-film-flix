import 'dart:convert';

import 'package:dio/dio.dart';
import 'dart:developer' as dev;

class CustomInterceptors extends Interceptor {
  static String redColor = '\x1B[31m';
  static String greenColor = '\x1B[32m';
  static String cyanColor = '\x1B[36m';
  static String whiteColor = '\x1B[37m';
  static const String _resetCode = '\x1B[0m';

  static void logInfo(String message, String color) =>
      dev.log('$color$message$_resetCode');

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final path = options.path;

    logInfo(
      '-------------------------------------------------------------',
      greenColor,
    );
    prettyPrint('PATH: $path', greenColor);
    logInfo(
      '-------------------------------------------------------------',
      greenColor,
    );
    super.onRequest(options, handler);
  }

  @override
  void onResponse(response, handler) {
    final statusCode = response.statusCode;
    final data = jsonEncode(response.data);

    logInfo(
      '-------------------------------------------------------------',
      greenColor,
    );
    prettyPrint('STATUS CODE: $statusCode', greenColor);
    logInfo(
      '-------------------------------------------------------------',
      greenColor,
    );

    logInfo(
      '-------------------------------------------------------------',
      greenColor,
    );
    prettyPrint('DATA: $data', greenColor);
    logInfo(
      '-------------------------------------------------------------',
      greenColor,
    );

    return handler.next(response);
  }

  @override
  void onError(DioException err, handler) {
    logInfo(
      '-------------------------- ERROR --------------------------',
      redColor,
    );
    prettyPrint(err.message, redColor);
    logInfo(
      '-------------------------------------------------------------',
      redColor,
    );

    return handler.next(err);
  }

  static JsonEncoder encoder = const JsonEncoder.withIndent('  ');

  static void prettyPrint(dynamic args, String color) {
    final prettyString = encoder.convert(args);
    prettyString.split('\n').forEach((e) => logInfo(e, color));
  }
}
