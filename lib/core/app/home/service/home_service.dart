import 'dart:async';

import 'package:filme_flix/common/http/service/_base/base_service.dart';
import 'package:filme_flix/common/models/movie.dart';

class HomeService {
  late final BaseService _baseService;

  HomeService(this._baseService);

  Future<List<Movie>> getMoviesByCategory({
    required String endpointPath,
    int page = 1,
  }) async {
    try {
      final response =
          await _baseService.get(endpointPath, queryParameters: {
        'page': page,
      });

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['results'];
        final movies = data.map((json) => Movie.fromJson(json)).toList();

        return movies;
      } else {
        throw Exception('Failed to load movies: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Failed to load movies: $e');
    }
  }
}
