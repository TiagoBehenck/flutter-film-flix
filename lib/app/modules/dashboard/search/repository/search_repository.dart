// Project imports:
import 'package:filme_flix/app/common/models/movie.dart';
import 'package:filme_flix/app/core/response/response.dart';
import 'package:filme_flix/app/modules/dashboard/search/service/search_service.dart';

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
