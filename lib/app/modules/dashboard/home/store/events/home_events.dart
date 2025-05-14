// Project imports:
import 'package:filme_flix/app/modules/dashboard/home/enum/movies_categories.dart';

sealed class HomeEvents {}

class GetMovies extends HomeEvents {
  final MoviesCategories category;

  GetMovies({
    this.category = MoviesCategories.popular,
  });
}
