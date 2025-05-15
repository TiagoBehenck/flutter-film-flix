// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:filme_flix/app/common/models/movie.dart';
import 'package:filme_flix/app/core/response/response.dart';
import 'package:filme_flix/app/modules/dashboard/home/enum/movies_categories.dart';
import 'package:filme_flix/app/modules/dashboard/home/repository/home_repository.dart';
import 'package:filme_flix/app/modules/dashboard/home/store/events/home_events.dart';
import 'package:filme_flix/app/modules/dashboard/home/store/state/home_state.dart';

class HomeBloc extends Bloc<HomeEvents, HomeState> {
  late final HomeRepository _repository;

  HomeBloc(this._repository) : super(HomeStateInitial()) {
    on<GetMovies>(_getHome);
  }

  Future<Response<Movie>> _fetchByCategory({
    required MoviesCategories category,
    required page,
  }) async {
    return switch (category) {
      MoviesCategories.inTheaters => await _repository.getMoviesByCategory(
          endpointPath: category.endpointPath, page: page),
      MoviesCategories.topRated => await _repository.getMoviesByCategory(
          endpointPath: category.endpointPath, page: page),
      MoviesCategories.popular => await _repository.getMoviesByCategory(
          endpointPath: category.endpointPath, page: page),
      MoviesCategories.discover => await _repository.getMoviesByCategory(
          endpointPath: category.endpointPath, page: page),
    };
  }

  Future<void> _loadMoreResults(
    MoviesCategories category,
    Emitter<HomeState> emit,
  ) async {
    if (state is HomeStateLoading) {
      return;
    }

    final currentState = state as HomeStateSuccess;

    if (currentState.page >= currentState.totalPages) {
      return;
    }

    final nextPage = currentState.page + 1;

    final movies = await _fetchByCategory(category: category, page: nextPage);

    emit(currentState.copyWith(
      page: movies.page,
      movies: [...currentState.movies, ...movies.results],
      totalPages: movies.totalPages,
      totalResults: movies.totalResults,
    ));
  }

  Future<void> _initialLoad(
    MoviesCategories category,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeStateLoading());

    final movies = await _fetchByCategory(category: category, page: 1);

    emit(HomeStateSuccess(
      page: movies.page,
      movies: movies.results,
      totalPages: movies.totalPages,
      totalResults: movies.totalResults,
    ));
  }

  Future<void> _getHome(
    GetMovies event,
    Emitter<HomeState> emit,
  ) async {

    try {
      if (state is HomeStateSuccess) {
        await _loadMoreResults(event.category, emit);
      } else {
        await _initialLoad(event.category, emit);
      }
    } catch (e) {
      emit(HomeStateError(error: e.toString()));
    }
  }
}
