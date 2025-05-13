import 'package:filme_flix/common/models/movie.dart';
import 'package:filme_flix/common/utils/debounce.dart';
import 'package:filme_flix/common/widgets/movie_list/movie_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:filme_flix/common/navigation/routes_constants.dart';

class SearchSuccess extends StatefulWidget {
  const SearchSuccess({
    required this.movies,
    required this.onLoadMore,
    super.key,
  });

  final List<Movie> movies;
  final VoidCallback onLoadMore;

  @override
  State<SearchSuccess> createState() => _SearchSuccessState();
}

class _SearchSuccessState extends State<SearchSuccess> {
  late final ScrollController _scrollController;
  
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }


  void _onScroll() {
    final screenEndReached = _scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 300;

    if (screenEndReached) {
      Debounce(delay: const Duration(milliseconds: 300)).call(
        widget.onLoadMore
      );
    }
  }
  

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: widget.movies.length,
      itemBuilder: (context, index) {
        final movie = widget.movies[index];
        return MovieList(
          movie: movie,
          onTap: () {
            context.push(
              RoutesConstants.detail,
              extra: widget.movies[index],
            );
          },
        );
      },
    );
  }
}
