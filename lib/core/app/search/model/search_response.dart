import 'package:filme_flix/common/models/json_serializable.dart';
import 'package:filme_flix/common/models/movie.dart';

class SearchResponse extends JsonSerializable {
  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  SearchResponse({
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

  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    return SearchResponse(
      page: json['page'],
      results: (json['results'] as List)
          .map((result) => Movie.fromJson(result))
          .toList(),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}