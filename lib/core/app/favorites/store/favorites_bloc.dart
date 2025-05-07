import 'package:filme_flix/core/app/favorites/repository/favorites_repository.dart';
import 'package:filme_flix/core/app/favorites/service/favorites_service.dart';
import 'package:filme_flix/infra/db/storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:filme_flix/core/app/favorites/store/events/favorites_events.dart';
import 'package:filme_flix/core/app/favorites/store/state/favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvents, FavoritesState> {
  final FavoritesService _service;
  late final Storage _storage;
  late final FavoritesRepository _repository;

  FavoritesBloc() : _storage = Storage(), _service = FavoritesService(Storage()), super(FavoritesStateInitial()) {
    _repository = FavoritesRepository(_service);
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
