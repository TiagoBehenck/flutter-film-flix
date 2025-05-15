// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:filme_flix/app/common/models/movie.dart';
import 'package:filme_flix/app/core/client/http/service/_base/base_service.dart';
import 'package:filme_flix/app/core/errors/app_error.dart';

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
    } on DioException catch (e, stackTrace) {
      throw NetworkError(stackTrace: stackTrace);
    } catch (e, _) {
      rethrow;
    }
  }

}
