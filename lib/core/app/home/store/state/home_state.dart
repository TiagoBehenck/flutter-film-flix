import 'package:filme_flix/common/models/movie.dart';

sealed class HomeState {}

class HomeStateInitial extends HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateSuccess extends HomeState {
  final List<Movie> movies;

  HomeStateSuccess({
    required this.movies,
  });
}

class HomeStateError extends HomeState {
  final String error;

  HomeStateError({required this.error});
}
