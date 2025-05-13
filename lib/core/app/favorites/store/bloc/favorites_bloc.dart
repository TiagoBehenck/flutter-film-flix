import 'package:filme_flix/core/app/favorites/repository/favorites_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:filme_flix/core/app/favorites/store/events/favorites_events.dart';
import 'package:filme_flix/core/app/favorites/store/state/favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvents, FavoritesState> {
  late final FavoritesRepository _repository;

  FavoritesBloc(this._repository) : super(FavoritesStateInitial()) {
    on<GetFavorites>(_getFavorites);
  }

  Future<void> _getFavorites(
    GetFavorites event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(FavoritesStateLoading());

    final favoritesMovies = await _repository.getFavorites();

    emit(FavoritesStateSuccess(favoritesMovies: favoritesMovies));
  }
}
