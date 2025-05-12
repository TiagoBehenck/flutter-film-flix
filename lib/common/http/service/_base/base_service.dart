import 'package:dio/dio.dart';
import 'package:filme_flix/app_config.dart';
import 'package:filme_flix/common/http/service/_base/custom_interceptors.dart';

class BaseService {
  static final BaseService _instance = BaseService._internal();
  final Dio client;

  factory BaseService() {
    return _instance;
  }

  BaseService._internal()
      : client = Dio(
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

  Future<dynamic> get(String url, {Map<String, dynamic>? queryParameters}) async {
    return await client.get(url, queryParameters: queryParameters);
  }
}