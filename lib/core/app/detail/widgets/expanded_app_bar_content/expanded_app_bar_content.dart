import 'package:filme_flix/common/styles/text/app_text_styles.dart';
import 'package:filme_flix/app_config.dart';
import 'package:filme_flix/core/app/detail/widgets/expanded_app_bar_content/poster_loading.dart';
import 'package:filme_flix/common/models/movie.dart';
import 'package:filme_flix/common/widgets/outlined_chip/outlined_chip.dart';
import 'package:flutter/material.dart';

class ExpandedAppBarContent extends StatelessWidget {
  const ExpandedAppBarContent({
    required this.movie,
    super.key,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 140,
          height: 200,
          child: Material(
            borderRadius: BorderRadius.circular(
              15,
            ),
            elevation: 7,
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              AppConfig.instance.imageUrl + movie.posterPath,
              fit: BoxFit.cover,
              loadingBuilder: (
                context,
                child,
                loadingProgress,
              ) {
                if (loadingProgress == null) return child;
                return const PosterLoading();
              },
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          movie.title,
          textAlign: TextAlign.center,
          style: AppTextStyles.h2,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          movie.tagline,
          style: AppTextStyles.bodyMedium,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedChip(
              label: (movie.voteAverage).toStringAsFixed(1),
              icon: const Icon(
                Icons.star,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            OutlinedChip(
              label: movie.productionCountries.first.iso31661,
              icon: const Icon(
                Icons.flag,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            OutlinedChip(
              label: movie.spokenLanguages.first.iso6391.toUpperCase(),
              icon: const Icon(
                Icons.language,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedChip(
              label: DateTime.tryParse(movie.releaseDate)?.year.toString() ?? '',
              icon: const Icon(
                Icons.calendar_today_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            OutlinedChip(
                label: '${movie.runtime ~/ 60}h ${movie.runtime % 60}m',
              icon: const Icon(
                Icons.access_time,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        )
      ],
    );
  }
}
