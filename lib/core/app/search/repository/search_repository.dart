import 'package:filme_flix/core/app/search/service/search_service.dart';
import 'package:filme_flix/models/movie.dart';

class SearchRepository {
  late final SearchService _repository;

  SearchRepository(
    this._repository,
  );

   Future<List<Movie>> searchMovies(String searchTerm) async {
    const page = 0;

    return _repository.searchMovies(searchTerm: searchTerm, page: page + 1);
  }
}