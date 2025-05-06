import 'dart:async';

import 'package:filme_flix/core/http/service/_base/base_service.dart';
import 'package:filme_flix/models/movie.dart';

class SearchService {
  late final BaseService _baseService;

  SearchService(this._baseService);

  Future<List<Movie>> searchMovies({
    String searchTerm = '',
    int page = 1,
  }) async {
    try {
      final response =
          await _baseService.get('/search/movie', queryParameters: {
        'query': searchTerm,
        'page': page,
      });

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['results'];
        return data.map((json) => Movie.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw Exception('Failed to load movies: $e');
    }
  }
}
