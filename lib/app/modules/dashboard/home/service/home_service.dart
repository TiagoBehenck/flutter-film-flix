// Dart imports:
import 'dart:async';

// Package imports:
import 'package:dio/dio.dart' as dio;

// Project imports:
import 'package:filme_flix/app/common/models/movie.dart';
import 'package:filme_flix/app/core/client/http/service/_base/base_service.dart';
import 'package:filme_flix/app/core/errors/app_error.dart';
import 'package:filme_flix/app/core/response/response.dart';
import 'package:filme_flix/app/modules/dashboard/home/model/home_response.dart';

class HomeService {
  late final BaseService _baseService;

  HomeService(this._baseService);

  Future<Response<Movie>> getMoviesByCategory({
    required String endpointPath,
    int page = 1,
  }) async {
    try {
      final response =
          await _baseService.get(endpointPath, queryParameters: {
        'page': page,
      });

      if (response.statusCode == 200) {
        final movies = HomeResponse.fromJson(response.data);

        return Response<Movie>(
          results: movies.results,
          page: movies.page,
          totalPages: movies.totalPages,
          totalResults: movies.totalResults,
        );
      } else {
        throw Exception('Failed to load movies: ${response.statusMessage}');
      }
    } on dio.DioException catch (e, stackTrace) {
      throw NetworkError(stackTrace: stackTrace);
    } catch (e, _) {
      rethrow;
    }
  }
}
