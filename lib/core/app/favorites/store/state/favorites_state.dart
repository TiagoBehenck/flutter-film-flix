import 'package:filme_flix/models/movie.dart';

sealed class FavoritesState {}

class FavoritesStateInitial extends FavoritesState {}

class FavoritesStateLoading extends FavoritesState {}

class FavoritesStateSuccess extends FavoritesState {
  final List<Movie> favoritesMovies;

  FavoritesStateSuccess({
    required this.favoritesMovies,
  });
}

class FavoritesStateError extends FavoritesState {
  final String error;

  FavoritesStateError({required this.error});
}
