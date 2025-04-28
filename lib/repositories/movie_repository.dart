import 'package:dio/dio.dart';
import 'package:filme_flix/app_config.dart';
import 'package:filme_flix/models/movie.dart';

class MovieRepository {
  final Dio client = Dio(
    BaseOptions(
      baseUrl: AppConfig.instance.baseUrl,
      headers: {
        'Authorization': 'Bearer ${AppConfig.instance.apiKey}',
        'Content-Type': 'application/json;charset=utf-8',
        'Accept': 'application/json',
      }, 
      queryParameters: {
        'language': 'pt-BR',
        'include_adult': false,
     }
    ),
  );

  Future<List<Movie>> getMovies() async {
    try {
      final response = await client.get('/discover/movie', queryParameters: {
        'page': 1,
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

  Future<List<Movie>> searchMovies(String query) async {
    try {
      final response = await client.get('/search/movie', queryParameters: {
        'query': query,
        'page': 1,
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
