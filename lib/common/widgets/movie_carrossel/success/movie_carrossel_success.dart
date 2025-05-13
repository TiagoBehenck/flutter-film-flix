import 'package:filme_flix/common/navigation/routes_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:filme_flix/common/models/movie.dart';
import 'package:filme_flix/common/widgets/movie_card/movie_card.dart';

class MovieCarrosselSuccess extends StatelessWidget {
  const MovieCarrosselSuccess({
    required this.movies,
    super.key,
  });

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return MovieCard(
            movie: movies[index],
            onTap: () {
              context.push(
                RoutesConstants.detail,
                extra: movies[index],
              );
            },
          );
        },
      ),
    );
  }
}
