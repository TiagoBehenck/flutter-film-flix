import 'package:filme_flix/common/models/movie.dart';

sealed class SearchState {}

class SearchStateInitial extends SearchState {
  List<Movie> searchResult = [];
}

class SearchStateLoading extends SearchState {}

class SearchStateSuccess extends SearchState {
  final int page;
  final int totalPages;
  final int totalResults;
  
  final List<Movie> searchResults;

  SearchStateSuccess({
    required this.page,
    required this.searchResults,
    required this.totalPages,
    required this.totalResults,
  });

  SearchStateSuccess copyWith({
    int? page,
    int? totalPages,
    int? totalResults,
    List<Movie>? searchResults,
  }) {
    return SearchStateSuccess(
      page: page ?? this.page,
      searchResults: searchResults ?? this.searchResults,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
    );
  }
}

class SearchStateError extends SearchState {
  final String error;

  SearchStateError({required this.error});
}