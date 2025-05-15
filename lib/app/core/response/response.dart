// Project imports:
import 'package:filme_flix/app/common/models/json_serializable.dart';

class Response<T extends JsonSerializable> extends JsonSerializable {
  final int page;
  final List<T> results;
  final int totalPages;
  final int totalResults;

  Response({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory Response.fromJson(Map<String, dynamic> json, Function fromJson) {
    return Response(
      page: json['page'] ?? 0,
      results: (json['results'] as List)
          .map((item) => fromJson(item))
          .toList()
          .cast<T>(),
      totalPages: json['total_pages'] ?? 0,
      totalResults: json['total_results'] ?? 0,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'results': results.map((item) => item.toMap()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }

  @override
  Map<String, dynamic> toJson() {
    return toMap();
  }
}
