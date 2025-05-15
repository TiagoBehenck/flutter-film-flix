// Project imports:
import 'package:filme_flix/app/common/models/movie.dart';

sealed class HomeState {}

class HomeStateInitial extends HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateSuccess extends HomeState {
  final int page;
  final int totalPages;
  final int totalResults;
  
  final List<Movie> movies;

  HomeStateSuccess({
    required this.page,
    required this.totalPages,
    required this.totalResults,
    required this.movies,
  });

  HomeStateSuccess copyWith({
    int? page,
    int? totalPages,
    int? totalResults,
    List<Movie>? movies,
  }) {
    return HomeStateSuccess(
      page: page ?? this.page,
      movies: movies ?? this.movies,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
    );
  }
}

class HomeStateError extends HomeState {
  final String error;

  HomeStateError({required this.error});
}
