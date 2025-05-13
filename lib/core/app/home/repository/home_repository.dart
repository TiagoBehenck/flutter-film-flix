import 'dart:async';

import 'package:filme_flix/core/app/home/service/home_service.dart';
import 'package:filme_flix/common/repository/cached/cached_repository.dart';
import 'package:filme_flix/common/models/movie.dart';

class HomeRepository extends CachedRepository {
  final HomeService _service;
  final String _moviesKey = 'movies';
  final String _moviesTopRatedKey = 'movies_to_rated';
  final String _moviesPopularKey = 'movies_popular';

  HomeRepository(
    this._service,
  );
  
  Future<List<Movie>> getMoviesByCategory({
    required String endpointPath,
    int page = 1,
  }) async {
    return await getListWithCache<Movie>(
      apiCall: () =>  _service.getMoviesByCategory(endpointPath: endpointPath, page: page),
      cacheKey: _moviesKey,
      cacheDuration: 60,
      forceRefresh: true,
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
