// Project imports:
import 'package:filme_flix/app/common/models/json_serializable.dart';
import 'package:filme_flix/app/common/models/movie.dart';

class HomeResponse extends JsonSerializable {
  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  HomeResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'results': results.map((result) => result.toJson()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }

  factory HomeResponse.fromJson(Map<String, dynamic> json) {
    return HomeResponse(
      page: json['page'],
      results: (json['results'] as List)
          .map((result) => Movie.fromJson(result))
          .toList(),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}
