// Project imports:
import 'package:filme_flix/app/common/infra/db/storage.dart';
import 'package:filme_flix/app/common/models/movie.dart';

class FavoritesService {
  final Storage _storage;
  final String favoritesStorageKey = 'favorites';

  FavoritesService(this._storage);

  Future<List<Movie>> getFavorites() async {
    return await _storage.get(key: favoritesStorageKey);
  }

  Future<List<Movie>> removeOneFavorite(Movie movie) async {
    return await _storage.removeItem(
      key: favoritesStorageKey,
      movie: movie,
    );
  }

  Future<List<Movie>> setFavorite(Movie movie) async {
    return await _storage.saveOne(key: favoritesStorageKey, movie: movie);
  }

  Future<Movie?> isFavorite(Movie movie) async {
    return await _storage.getOne(key: favoritesStorageKey, movieId: movie.id);
  }
}
