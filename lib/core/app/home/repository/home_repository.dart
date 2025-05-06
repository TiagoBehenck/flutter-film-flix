import 'dart:async';

import 'package:filme_flix/core/app/home/service/home_service.dart';
import 'package:filme_flix/core/repository/cached/cached_repository.dart';
import 'package:filme_flix/models/movie.dart';

class HomeRepository extends CachedRepository {
  final HomeService _service;

  HomeRepository(
    this._service,
  );
  
  Future<List<Movie>> getMovies() async {
    return getListWithCache<Movie>(
      apiCall: () =>  _service.getMovies(),
      cacheKey: 'movies',
      cacheDuration: 60,
    );
  }

  Future<List<Movie>> getTopRatedMovies() async {
    return getListWithCache<Movie>(
      apiCall: () =>  _service.getTopRatedMovies(),
      cacheKey: 'movies_top_rated',
      cacheDuration: 60,
    );
  }

  Future<List<Movie>> getPopularMovies() async {
    return getListWithCache<Movie>(
      apiCall: () =>  _service.getPopularMovies(),
      cacheKey: 'movies_popular',
      cacheDuration: 60,
    );
  }
  
  @override
  Future<void> clearAllCache() {
    // TODO: implement clearAllCache
    throw UnimplementedError();
  }
}
