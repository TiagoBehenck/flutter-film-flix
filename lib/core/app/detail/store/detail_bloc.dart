import 'package:filme_flix/core/app/detail/service/detail_service.dart';
import 'package:filme_flix/core/app/detail/store/events/detail_events.dart';
import 'package:filme_flix/core/app/detail/store/state/detail_state.dart';
import 'package:filme_flix/core/app/favorites/repository/favorites_repository.dart';
import 'package:filme_flix/core/app/favorites/service/favorites_service.dart';
import 'package:filme_flix/core/app/favorites/store/events/favorites_events.dart';
import 'package:filme_flix/core/app/favorites/store/favorites_bloc.dart';
import 'package:filme_flix/core/http/service/_base/base_service.dart';
import 'package:filme_flix/infra/db/storage.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class DetailBloc extends Bloc<DetailEvents, DetailState> {
  final DetailService _service;
  late final FavoritesRepository _repository;
  final FavoritesBloc favoritesBloc;
  
  DetailBloc({
     required this.favoritesBloc,
  })
      : _service = DetailService(BaseService()),
        super(DetailStateStateInitial()) {
    _repository = FavoritesRepository(FavoritesService(Storage()));
    on<GetIsFavoriteMovie>(_getIsFavoriteMovie);
    on<ToggleFavoriteMovie>(_toggleFavoriteMovie);
  }

  Future<void> _getIsFavoriteMovie(
    GetIsFavoriteMovie event,
    Emitter<DetailState> emit,
  ) async {
    emit(DetailStateStateLoading());

    final isFavoriteMovieFromDb = await _repository.isFavorite(event.movie);

    emit(DetailStateStateSuccess(
        isFavoriteMovie: isFavoriteMovieFromDb != null));
  }

  Future<void> _toggleFavoriteMovie(
    ToggleFavoriteMovie event,
    Emitter<DetailState> emit,
  ) async {
    if (state is DetailStateStateSuccess) {
      final successState = state as DetailStateStateSuccess;

      if (successState.isFavoriteMovie) {
        await _repository.removeOneFavorite(event.movie);
      } else {
        await _repository.saveFavorite(event.movie);
      }

      emit(DetailStateStateSuccess(
          isFavoriteMovie: !successState.isFavoriteMovie,));
      
      favoritesBloc.add(GetFavorites());
    }
  }
}
