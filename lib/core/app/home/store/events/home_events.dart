import 'package:filme_flix/core/app/home/enum/movies_categories.dart';

sealed class HomeEvents {}

class GetMovies extends HomeEvents {
  final MoviesCategories category;

  GetMovies({
    this.category = MoviesCategories.popular,
  });
}