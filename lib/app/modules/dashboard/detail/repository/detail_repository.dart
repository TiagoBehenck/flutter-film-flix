// Project imports:
import 'package:filme_flix/app/common/models/movie.dart';
import 'package:filme_flix/app/common/repository/cached/cached_repository.dart';
import 'package:filme_flix/app/modules/dashboard/detail/service/detail_service.dart';

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
