import 'package:filme_flix/app_config.dart';
import 'package:filme_flix/models/movie.dart';
import 'package:filme_flix/widgets/movie_card/movie_card_error.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
    required this.onTap,
  });

  final Movie movie;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Hero(
          tag: movie.id,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              AppConfig.instance.imageUrl + movie.posterPath,
              fit: BoxFit.cover,
              width: 120,
              height: 180,
              errorBuilder: (context, error, stackTrace) =>
                  MovieCardError(onRetry: () {}),
            ),
          ),
        ),
      ),
    );
  }
}
