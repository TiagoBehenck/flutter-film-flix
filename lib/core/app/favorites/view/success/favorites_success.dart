import 'package:filme_flix/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:filme_flix/app_config.dart';
import 'package:filme_flix/core/navigation/routes_constants.dart';

class FavoritesSuccess extends StatelessWidget {
  const FavoritesSuccess({required this.favoriteMovie, super.key});

  final List<Movie> favoriteMovie;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: favoriteMovie.length,
      itemBuilder: (context, index) {
        final favorite = favoriteMovie[index];
        return ListTile(
          dense: true,
          visualDensity: const VisualDensity(vertical: 4),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              AppConfig.instance.imageUrl + favorite.posterPath,
              width: 60,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            favorite.title,
            style: const TextStyle(
              color: Color(0xffF3F3F3),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            DateTime.tryParse(favorite.releaseDate)?.year.toString() ?? '',
            style: const TextStyle(
              color: Color(0xff969696),
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
          onTap: () {
            context.push(
              RoutesConstants.detail,
              extra: favorite,
            );
          },
        );
      },
    );
  }
}
