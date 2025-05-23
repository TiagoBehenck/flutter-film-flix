// Project imports:
import 'package:filme_flix/app/common/models/movie.dart';

sealed class FavoritesEvents {}

class GetFavorites extends FavoritesEvents {
  final List<Movie>? favoritesMovies;

  GetFavorites({
    this.favoritesMovies,
  });
}
