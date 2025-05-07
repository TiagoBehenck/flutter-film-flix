import 'dart:async';

import 'package:filme_flix/core/http/service/_base/base_service.dart';
import 'package:filme_flix/models/movie.dart';

class HomeService {
  late final BaseService _baseService;

  HomeService(this._baseService);

  Future<List<Movie>> getMovies({int page = 1}) async {
    try {
      final response =
          await _baseService.get('/discover/movie', queryParameters: {
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


  Future<List<Movie>> getTopRatedMovies({int page = 1}) async {
    try {
      final response =
          await _baseService.get('/movie/top_rated', queryParameters: {
        'page': page,
      });

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['results'];
        final movies = data.map((json) => Movie.fromJson(json)).toList();

        return movies;
      } else {
        throw Exception('Failed to load top rated movies');
      }
    } catch (e) {
      throw Exception('Failed to load top rated movies: $e');
    }
  }

  Future<List<Movie>> getPopularMovies() async {
    try {
      final response =
          await _baseService.get('/movie/popular', queryParameters: {
        'page': 2,
      });

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['results'];
        final movies = data.map((json) => Movie.fromJson(json)).toList();

        return movies;
      } else {
        throw Exception('Failed to load popular movies');
      }
    } catch (e) {
      throw Exception('Failed to load popular movies: $e');
    }
  }
}
