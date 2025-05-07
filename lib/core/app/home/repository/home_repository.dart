import 'dart:async';

import 'package:filme_flix/core/app/home/service/home_service.dart';
import 'package:filme_flix/core/repository/cached/cached_repository.dart';
import 'package:filme_flix/models/movie.dart';

class HomeRepository extends CachedRepository {
  final HomeService _service;
  final String _moviesKey = 'movies';
  final String _moviesTopRatedKey = 'movies_to_rated';
  final String _moviesPopularKey = 'movies_popular';

  HomeRepository(
    this._service,
  );
  
  Future<List<Movie>> getMovies() async {
    return getListWithCache<Movie>(
      apiCall: () =>  _service.getMovies(),
      cacheKey: _moviesKey,
      cacheDuration: 60,
    );
  }

  Future<List<Movie>> getTopRatedMovies() async {
    return getListWithCache<Movie>(
      apiCall: () =>  _service.getTopRatedMovies(),
      cacheKey: _moviesTopRatedKey,
      cacheDuration: 60,
    );
  }

  Future<List<Movie>> getPopularMovies() async {
    return getListWithCache<Movie>(
      apiCall: () =>  _service.getPopularMovies(),
      cacheKey: _moviesPopularKey,
      cacheDuration: 60,
    );
  }

  Future<void> clearAllCache() async {
    await Future.wait([
      clearCache(_moviesKey),
      clearCache(_moviesTopRatedKey),
      clearCache(_moviesPopularKey),
    ]);
  }
}
