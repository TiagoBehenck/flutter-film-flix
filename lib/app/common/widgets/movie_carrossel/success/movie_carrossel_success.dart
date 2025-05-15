// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:filme_flix/app/common/models/movie.dart';
import 'package:filme_flix/app/common/utils/debounce.dart';
import 'package:filme_flix/app/common/widgets/movie_card/movie_card.dart';
import 'package:filme_flix/app/core/navigation/routes_constants.dart';

class MovieCarrosselSuccess extends StatefulWidget {
  const MovieCarrosselSuccess({
    required this.movies,
    required this.onLoadMore,
    super.key,
  });

  final List<Movie> movies;
  final VoidCallback onLoadMore;

  @override
  State<MovieCarrosselSuccess> createState() => _MovieCarrosselSuccessState();
}

class _MovieCarrosselSuccessState extends State<MovieCarrosselSuccess> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final screenEndReached = _scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent;
    
    if (screenEndReached) {
      Debounce(delay: const Duration(milliseconds: 300)).call(
        widget.onLoadMore
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.movies.length,
        itemBuilder: (context, index) {
          return MovieCard(
            movie: widget.movies[index],
            onTap: () {
              context.push(
                RoutesConstants.detail,
                extra: widget.movies[index],
              );
            },
          );
        },
      ),
    );
  }
}
