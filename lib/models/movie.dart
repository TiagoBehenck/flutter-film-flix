import 'dart:convert';

class Movie {
  final int id;
  final String? title;
  final String? imagePath;
  final String? releaseDate;

  Movie({
    required this.id,
    this.title,
    this.imagePath,
    this.releaseDate,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      imagePath: json['poster_path'] ?? '',
      releaseDate: json['release_date'] ?? '',
    );
  }

  String get toJson => jsonEncode({
        'id': id,
        'title': title,
        'poster_path': imagePath,
        'release_date': releaseDate,
      });
}
