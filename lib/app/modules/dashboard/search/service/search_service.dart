// Dart imports:
import 'dart:async';

// Package imports:
import 'package:dio/dio.dart' as dio;

// Project imports:
import 'package:filme_flix/app/common/models/movie.dart';
import 'package:filme_flix/app/core/client/http/service/_base/base_service.dart';
import 'package:filme_flix/app/core/errors/app_error.dart';
import 'package:filme_flix/app/core/response/response.dart';
import 'package:filme_flix/app/modules/dashboard/search/model/search_response.dart';

class SearchService {
  late final BaseService _baseService;

  SearchService(this._baseService);

  Future<Response<Movie>> searchMovies({
    required  searchTerm,
    required int page,
  }) async {
    try {
      final response =
          await _baseService.get('/search/movie', queryParameters: {
        'query': searchTerm,
        'page': page,
      });

      if (response.statusCode == 200) {
        final searchResponse = SearchResponse.fromJson(response.data);
        
        return Response<Movie>(
          results: searchResponse.results,
          page: searchResponse.page,
          totalPages: searchResponse.totalPages,
          totalResults: searchResponse.totalResults,
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
