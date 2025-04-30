import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:filme_flix/app_config.dart';
import 'package:filme_flix/models/movie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MovieRepository {
  final Dio client = Dio(
    BaseOptions(baseUrl: AppConfig.instance.baseUrl, headers: {
      'Authorization': 'Bearer ${AppConfig.instance.apiKey}',
      'Content-Type': 'application/json;charset=utf-8',
      'Accept': 'application/json',
    }, queryParameters: {
      'include_adult': false,
    }),
  );

  SharedPreferences? _preferences;
  final String moviesKey = 'movies';
  final String popularMoviesKey = 'popular_movies';
  final String topRatedMoviesKey = 'top_rated_movies';

  FutureOr<SharedPreferences> get db async {
    _preferences ??= await SharedPreferences.getInstance();
    return _preferences!;
  }

  Future<List<Movie>> getMovies() async {
    try {
      final moviesFromStorage = await getMoviesFromStorage();
      if (moviesFromStorage.isNotEmpty) {
        return moviesFromStorage;
      } else {
        return await getMoviesFromApi();
      }
    } catch (e) {
      throw Exception('Failed to load movies: $e');
    }
  }

  Future<List<Movie>> getMoviesFromStorage() async {
    try {
      final storage = await db;
      final List<String>? moviesJson = storage.getStringList(moviesKey);

      if (moviesJson != null) {
        return moviesJson
            .map((movie) => Movie.fromJson(jsonDecode(movie)))
            .toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Failed to load movies from storage: $e');
    }
  }

  Future<List<Movie>> getMoviesFromApi() async {
    try {
      final response = await client.get('/discover/movie', queryParameters: {
        'page': 1,
      });

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['results'];
        final movies = data.map((json) => Movie.fromJson(json)).toList();

        final storage = await db;
        storage.setStringList(
            moviesKey, movies.map((movie) => movie.toJson).toList());

        return movies;
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw Exception('Failed to load movies: $e');
    }
  }

  Future<List<Movie>> getPopularMovies() async {
    try {
      final popularMoviesFromStorage = await getPopularMoviesFromStorage();
      if (popularMoviesFromStorage.isNotEmpty) {
        return popularMoviesFromStorage;
      } else {
        return await getPopularMoviesFromApi();
      }
    } catch (e) {
      throw Exception('Failed to load popular movies: $e');
    }
  }

  Future<List<Movie>> getPopularMoviesFromStorage() async {
    try {
      final storage = await db;
      final List<String>? popularMoviesJson =
          storage.getStringList(popularMoviesKey);

      if (popularMoviesJson != null) {
        return popularMoviesJson
            .map((movie) => Movie.fromJson(jsonDecode(movie)))
            .toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Failed to load popular movies from storage: $e');
    }
  }

  Future<List<Movie>> getPopularMoviesFromApi() async {
    try {
      final response = await client.get('/movie/popular', queryParameters: {
        'page': 1,
      });

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['results'];
        final movies = data.map((json) => Movie.fromJson(json)).toList();

        final storage = await db;
        storage.setStringList(
            popularMoviesKey, movies.map((movie) => movie.toJson).toList());

        return movies;
      } else {
        throw Exception('Failed to load popular movies');
      }
    } catch (e) {
      throw Exception('Failed to load popular movies: $e');
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    try {
      final topRatedMoviesFromStorage = await getTopRatedMoviesFromStorage();
      if (topRatedMoviesFromStorage.isNotEmpty) {
        return topRatedMoviesFromStorage;
      } else {
        return await getTopRatedMoviesFromApi();
      }
    } catch (e) {
      throw Exception('Failed to load top rated movies: $e');
    }
  }

  Future<List<Movie>> getTopRatedMoviesFromStorage() async {
    try {
      final storage = await db;
      final List<String>? topRatedMoviesJson =
          storage.getStringList(topRatedMoviesKey);

      if (topRatedMoviesJson != null) {
        return topRatedMoviesJson
            .map((movie) => Movie.fromJson(jsonDecode(movie)))
            .toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Failed to load top rated movies from storage: $e');
    }
  }

  Future<List<Movie>> getTopRatedMoviesFromApi() async {
    try {
      final response = await client.get('/movie/top_rated', queryParameters: {
        'page': 1,
      });

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['results'];
        final movies = data.map((json) => Movie.fromJson(json)).toList();
        
        final storage = await db;
        storage.setStringList(
            topRatedMoviesKey, movies.map((movie) => movie.toJson).toList());
        
        return movies;
      } else {
        throw Exception('Failed to load top rated movies');
      }
    } catch (e) {
      throw Exception('Failed to load top rated movies: $e');
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

  Future<Movie> getMovieDetails(int movieId) async {
    try {
      final response = await client.get('/movie/$movieId');

      if (response.statusCode == 200) {
        return Movie.fromJson(response.data);
      } else {
        throw Exception('Failed to load movie details');
      }
    } catch (e) {
      throw Exception('Failed to load movie details: $e');
    }
  }
}
