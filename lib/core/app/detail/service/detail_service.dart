import 'package:filme_flix/common/http/service/_base/base_service.dart';
import 'package:filme_flix/common/models/movie.dart';

class DetailService {
  late final BaseService _baseService;

  DetailService(this._baseService);

    Future<Movie> getMovieDetails({
    required int movieId,
  }) async {
    try {
      final response = await _baseService.get('/movie/$movieId');

      if (response.statusCode == 200) {
        return Movie.fromJson(response.data);
      } else {
        throw Exception('Failed to load movie details');
      }
    } catch (e) {
      throw Exception('Failed to load movie details: $e');
    }
  }

}