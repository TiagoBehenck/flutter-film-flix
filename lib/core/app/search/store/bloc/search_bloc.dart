import 'package:filme_flix/core/app/search/repository/search_repository.dart';
import 'package:filme_flix/core/app/search/service/search_service.dart';
import 'package:filme_flix/core/app/search/store/events/search_events.dart';
import 'package:filme_flix/core/app/search/store/state/search_state.dart';
import 'package:filme_flix/common/http/service/_base/base_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBloc extends Bloc<SearchEvents, SearchState> {
  final SearchService _service;
  late final SearchRepository _repository;

  SearchBloc()
      : _service = SearchService(BaseService()),
        super(SearchStateInitial()) {
    _repository = SearchRepository(_service);
    on<GetSearch>(_getSearch);
    on<SearchInitial>((event, emit) {
      emit(SearchStateInitial());
    });
  }

  Future<void> _getSearch(
    GetSearch event,
    Emitter<SearchState> emit,
  ) async {
    if (event.searchText.isEmpty) {
      emit(SearchStateInitial());
      return;
    }

    if (state is SearchStateSuccess) {
      final currentState = state as SearchStateSuccess;
      final isLastPage = currentState.page >= currentState.totalPages;

      if (isLastPage) {
        return;
      }

      try {
        final searchResults = await _repository.searchMovies(
            searchTerm: event.searchText, page: currentState.page + 1);

        emit(currentState.copyWith(
          page: searchResults.page,
          searchResults: [
            ...currentState.searchResults,
            ...searchResults.results
          ],
          totalPages: searchResults.totalPages,
          totalResults: searchResults.totalResults,
        ));
      } catch (e) {
        emit(SearchStateError(error: e.toString()));
      }
    } else {
      try {
        emit(SearchStateLoading());
        final searchResults = await _repository.searchMovies(
            searchTerm: event.searchText, page: 1);

        emit(SearchStateSuccess(
          page: searchResults.page,
          searchResults: searchResults.results,
          totalPages: searchResults.totalPages,
          totalResults: searchResults.totalResults,
        ));
      } catch (e) {
        emit(SearchStateError(error: e.toString()));
      }
    }
  }
}
