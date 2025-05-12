import 'dart:async';

import 'package:filme_flix/core/app/search/model/search_response.dart';
import 'package:filme_flix/common/http/service/_base/base_service.dart';
import 'package:filme_flix/common/models/movie.dart';
import 'package:filme_flix/common/models/response.dart';

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
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw Exception('Failed to load movies: $e');
    }
  }
}
