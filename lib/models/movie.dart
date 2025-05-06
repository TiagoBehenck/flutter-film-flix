import 'package:filme_flix/models/genre.dart';
import 'package:filme_flix/models/json_serializable.dart';
import 'package:filme_flix/models/production_company.dart';
import 'package:filme_flix/models/production_country.dart';
import 'package:filme_flix/models/spoken_language.dart';

class Movie extends JsonSerializable<Movie> {
  final bool adult;
  final String backdropPath;// null ou objeto
  final int budget;
  final List<Genre> genres;
  final String homepage;
  final int id;
  final String imdbId;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final List<ProductionCompany> productionCompanies;
  final List<ProductionCountry> productionCountries;
  final String releaseDate;
  final int revenue;
  final int runtime;
  final List<SpokenLanguage> spokenLanguages;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;
  final dynamic belongsToCollection;

  Movie({
    required this.adult,
    required this.backdropPath,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    this.belongsToCollection,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      adult: json['adult'] ?? false,
      backdropPath: json['backdrop_path'] ?? '',
      belongsToCollection: json['belongs_to_collection'],
      budget: json['budget'] ?? 0,
      genres: (json['genres'] as List?)?.map((e) => Genre.fromJson(e)).toList() ?? [],
      homepage: json['homepage'] ?? '',
      id: json['id'] ?? 0,
      imdbId: json['imdb_id'] ?? '',
      originCountry: (json['origin_country'] as List?)?.map((e) => e as String).toList() ?? [],
      originalLanguage: json['original_language'] ?? '',
      originalTitle: json['original_title'] ?? '',
      overview: json['overview'] ?? '',
      popularity: (json['popularity'] is double) ? json['popularity'] : (json['popularity'] as num?)?.toDouble() ?? 0.0,
      posterPath: json['poster_path'] ?? '',
      productionCompanies: (json['production_companies'] as List?)?.map((e) => ProductionCompany.fromJson(e)).toList() ?? [],
      productionCountries: (json['production_countries'] as List?)?.map((e) => ProductionCountry.fromJson(e)).toList() ?? [],
      releaseDate: json['release_date'] ?? '',
      revenue: json['revenue'] ?? 0,
      runtime: json['runtime'] ?? 0,
      spokenLanguages: (json['spoken_languages'] as List?)?.map((e) => SpokenLanguage.fromJson(e)).toList() ?? [],
      status: json['status'] ?? '',
      tagline: json['tagline'] ?? '',
      title: json['title'] ?? '',
      video: json['video'] ?? false,
      voteAverage: (json['vote_average'] is double) ? json['vote_average'] : (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      voteCount: json['vote_count'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'belongs_to_collection': belongsToCollection,
      'budget': budget,
      'genres': genres.map((e) => e.toMap()).toList(),
      'homepage': homepage,
      'id': id,
      'imdb_id': imdbId,
      'origin_country': originCountry,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'production_companies': productionCompanies.map((e) => e.toMap()).toList(),
      'production_countries': productionCountries.map((e) => e.toMap()).toList(),
      'release_date': releaseDate,
      'revenue': revenue,
      'runtime': runtime,
      'spoken_languages': spokenLanguages.map((e) => e.toMap()).toList(),
      'status': status,
      'tagline': tagline,
      'title': title,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }
  
  @override
  Map<String, dynamic> toJson() {
    return toMap();
  }
}
