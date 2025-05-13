
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:filme_flix/common/models/movie.dart';
import 'package:filme_flix/core/app/home/enum/movies_categories.dart';
import 'package:filme_flix/core/app/home/repository/home_repository.dart';
import 'package:filme_flix/core/app/home/store/events/home_events.dart';
import 'package:filme_flix/core/app/home/store/state/home_state.dart';

class HomeBloc extends Bloc<HomeEvents, HomeState> {
  late final HomeRepository _repository;

  HomeBloc(this._repository)
      : super(HomeStateInitial()) {
    on<GetMovies>(_getHome);
  }

  Future<List<Movie>> _fetchByCategory(
    MoviesCategories category,
  ) async {
    return switch (category) {
      MoviesCategories.inTheaters =>  await _repository.getMoviesByCategory(endpointPath: category.endpointPath),
      MoviesCategories.topRated => await _repository.getMoviesByCategory(endpointPath: category.endpointPath),
      MoviesCategories.popular => await _repository.getMoviesByCategory(endpointPath: category.endpointPath),
      MoviesCategories.discover => await _repository.getMoviesByCategory(endpointPath: category.endpointPath),
    };
  }

  Future<void> _getHome(
    GetMovies event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeStateLoading());
    
    final movies = await _fetchByCategory(event.category);

    emit(HomeStateSuccess(movies: movies));
  }
}