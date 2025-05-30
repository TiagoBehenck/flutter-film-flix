// Project imports:
import 'package:filme_flix/app/common/models/movie.dart';
import 'package:filme_flix/app/modules/dashboard/favorites/service/favorites_service.dart';

class FavoritesRepository {
  final FavoritesService _service;

  FavoritesRepository(
    this._service,
  );

  Future<List<Movie>> getFavorites() async {
    return await _service.getFavorites();
  }

  Future<List<Movie>> saveFavorite(Movie movie) async {
    return await _service.setFavorite(movie);
  }

  Future<List<Movie>> removeOneFavorite(Movie movie) async {
    return await _service.removeOneFavorite(movie);
  }

  Future<Movie?> isFavorite(Movie movie) async { 
    return await _service.isFavorite(movie);
  }
}
