import 'package:filme_flix/core/app/detail/service/detail_service.dart';
import 'package:filme_flix/common/repository/cached/cached_repository.dart';
import 'package:filme_flix/common/models/movie.dart';

class DetailRepository extends CachedRepository {
  final DetailService _service;
  
  DetailRepository(
    this._service,
  );
  
   Future<Movie> getMovieDetails(int movieId) async {
    return getObjectWithCache<Movie>(
      apiCall: () => _service.getMovieDetails(movieId: movieId),
      cacheKey: 'movie_details_$movieId',
      cacheDuration: 60, // Cache de 1 hora
    );
  }
}