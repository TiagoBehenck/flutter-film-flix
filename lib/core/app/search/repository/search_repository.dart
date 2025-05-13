import 'package:filme_flix/core/app/search/service/search_service.dart';
import 'package:filme_flix/common/models/movie.dart';
import 'package:filme_flix/common/models/response.dart';

class SearchRepository {
  late final SearchService _service;

  SearchRepository(
    this._service,
  );

   Future<Response<Movie>> searchMovies({
      required String searchTerm,
      required int page,
    }) async {
    return _service.searchMovies(searchTerm: searchTerm, page: page);
  }
}