// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:filme_flix/app/core/client/http/service/_base/custom_interceptors.dart';
import 'package:filme_flix/app/core/config/app_config.dart';

class BaseService {
  final Dio client = Dio(
    BaseOptions(
      baseUrl: AppConfig.instance.baseUrl,
      headers: {
        'Authorization': 'Bearer ${AppConfig.instance.apiKey}',
        'Content-Type': 'application/json;charset=utf-8',
        'Accept': 'application/json',
      },
      queryParameters: {
        'include_adult': false,
      },
    ),
  )..interceptors.add(CustomInterceptors());

  Future<dynamic> get(String url,
      {Map<String, dynamic>? queryParameters}) async {
    return await client.get(url, queryParameters: queryParameters);
  }
}
