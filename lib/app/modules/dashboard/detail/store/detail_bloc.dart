// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:filme_flix/app/modules/dashboard/detail/store/events/detail_events.dart';
import 'package:filme_flix/app/modules/dashboard/detail/store/state/detail_state.dart';
import 'package:filme_flix/app/modules/dashboard/favorites/repository/favorites_repository.dart';
import 'package:filme_flix/app/modules/dashboard/favorites/store/bloc/favorites_bloc.dart';
import 'package:filme_flix/app/modules/dashboard/favorites/store/events/favorites_events.dart';

class DetailBloc extends Bloc<DetailEvents, DetailState> {
  late final FavoritesRepository _repository;
  final FavoritesBloc favoritesBloc;

  DetailBloc(
    this.favoritesBloc,
    this._repository,
  ) : super(DetailStateStateInitial()) {
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
        isFavoriteMovie: !successState.isFavoriteMovie,
      ));

      favoritesBloc.add(GetFavorites());
    }
  }
}
