// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:filme_flix/app/common/models/movie.dart';
import 'package:filme_flix/app/common/styles/text/app_text_styles.dart';
import 'package:filme_flix/app/core/config/app_config.dart';
import 'package:filme_flix/app/core/navigation/routes_constants.dart';

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
            style: AppTextStyles.h5,
          ),
          subtitle: Text(
            DateTime.tryParse(favorite.releaseDate)?.year.toString() ?? '',
            style: AppTextStyles.captionSmall,
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
