import 'package:filme_flix/models/movie.dart';

sealed class FavoritesEvents {}

class GetFavorites extends FavoritesEvents {
  final List<Movie>? favoritesMovies;

  GetFavorites({
    this.favoritesMovies,
  });
}
