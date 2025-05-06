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

  @override
  void initState() {
    super.initState();
    _service = SearchService(BaseService());
    _repository = SearchRepository(
      _service,
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    final ValueNotifier<List<Movie>> searchResults = ValueNotifier([]);

    Future<void> fetchMovies(String query) async {
      final List<Movie> fetchedMovies = await _repository.searchMovies(query);
      searchResults.value = fetchedMovies;
    }

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Text(
          'Search',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
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
                          onFavorite: () {},
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
