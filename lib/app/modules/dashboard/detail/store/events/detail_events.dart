// Project imports:
import 'package:filme_flix/app/common/models/movie.dart';

sealed class DetailEvents {}

class GetIsFavoriteMovie extends DetailEvents {
  final Movie movie;

  GetIsFavoriteMovie({required this.movie});
}

class ToggleFavoriteMovie extends DetailEvents {
  final Movie movie;
  
  ToggleFavoriteMovie({required this.movie});
}
