import 'package:filme_flix/core/app/search/repository/search_repository.dart';
import 'package:filme_flix/core/app/search/store/events/search_events.dart';
import 'package:filme_flix/core/app/search/store/state/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBloc extends Bloc<SearchEvents, SearchState> {
  final SearchRepository _repository;

  SearchBloc(this._repository) : super(SearchStateInitial()) {
    on<GetSearch>(_getSearch);
    on<SearchInitial>((event, emit) {
      emit(SearchStateInitial());
    });
  }

  Future<void> _loadMoreResults(
      String searchTerm, Emitter<SearchState> emit) async {

    if (state is SearchStateLoading) {
      return;
    }
    
    final currentState = state as SearchStateSuccess;

    if (currentState.page >= currentState.totalPages) {
      return;
    }

    final nextPage = currentState.page + 1;
    final searchResults =
        await _repository.searchMovies(searchTerm: searchTerm, page: nextPage);

    emit(currentState.copyWith(
      page: searchResults.page,
      searchResults: [...currentState.searchResults, ...searchResults.results],
      totalPages: searchResults.totalPages,
      totalResults: searchResults.totalResults,
    ));
  }

  Future<void> _initialSearch(
      String searchTerm, Emitter<SearchState> emit) async {
    emit(SearchStateLoading());

    final searchResults =
        await _repository.searchMovies(searchTerm: searchTerm, page: 1);

    // Emitir resultados encontrados
    emit(SearchStateSuccess(
      page: searchResults.page,
      searchResults: searchResults.results,
      totalPages: searchResults.totalPages,
      totalResults: searchResults.totalResults,
    ));
  }

  Future<void> _getSearch(
    GetSearch event,
    Emitter<SearchState> emit,
  ) async {
    if (event.searchTerm.isEmpty) {
      emit(SearchStateInitial());
      return;
    }

    try {
      if (state is SearchStateSuccess) {
        await _loadMoreResults(event.searchTerm, emit);
      } else {
        await _initialSearch(event.searchTerm, emit);
      }
    } catch (e) {
      emit(SearchStateError(error: e.toString()));
    }
  }
}
