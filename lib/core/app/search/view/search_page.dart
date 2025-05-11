import 'package:filme_flix/common/styles/text/app_text_styles.dart';
import 'package:filme_flix/core/app/search/repository/search_repository.dart';
import 'package:filme_flix/core/app/search/service/search_service.dart';
import 'package:filme_flix/core/http/service/_base/base_service.dart';
import 'package:filme_flix/core/navigation/routes_constants.dart';
import 'package:filme_flix/models/movie.dart';
import 'package:filme_flix/widgets/movie_list/movie_list.dart';
import 'package:filme_flix/widgets/search_input/search_input.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final SearchRepository _repository;
  late final SearchService _service;
  late final ScrollController _scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();
  final ValueNotifier<List<Movie>> searchResults = ValueNotifier([]);

  Future<void> fetchMovies(String query) async {
    final List<Movie> fetchedMovies = await _repository.searchMovies(query);
    searchResults.value = [...searchResults.value, ...fetchedMovies];
  }

  @override
  void initState() {
    super.initState();
    _service = SearchService(BaseService());
    _repository = SearchRepository(
      _service,
    );
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() async {
    final screenEndReached = _scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 300;

    if (screenEndReached) {
      await fetchMovies(searchController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          'Search',
          style: AppTextStyles.h3,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            SearchInput(
              controller: searchController,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  fetchMovies(value);
                } else {
                  searchResults.value = [];
                }
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: ValueListenableBuilder<List<Movie>>(
                  valueListenable: searchResults,
                  builder: (context, movies, _) {
                    return ListView.builder(
                      controller: _scrollController,
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        final movie = movies[index];
                        return MovieList(
                          movie: movie,
                          onTap: () {
                            context.push(
                              RoutesConstants.detail,
                              extra: movies[index],
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
