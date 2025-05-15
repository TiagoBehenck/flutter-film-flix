// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:filme_flix/app/common/models/movie.dart';
import 'package:filme_flix/app/common/styles/text/app_text_styles.dart';
import 'package:filme_flix/app/core/config/app_config.dart';

class MovieList extends StatelessWidget {
  const MovieList({
    required this.onTap,
    required this.movie,
    super.key,
  });

  final VoidCallback onTap;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          dense: true,
          visualDensity: const VisualDensity(vertical: 4),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: movie.posterPath.isNotEmpty
                ? Image.network(
                    AppConfig.instance.imageUrl + movie.posterPath,
                    fit: BoxFit.cover,
                    width: 60,
                    height: 80,
                  )
                : const SizedBox(
                    width: 60,
                    height: 80,
                    child: Icon(
                      Icons.broken_image,
                      size: 40,
                      color: Colors.grey,
                    ),
                  ),
          ),
          title: Text(
            movie.title,
            style: AppTextStyles.h5,
          ),
          subtitle: Text(
            DateTime.tryParse(movie.releaseDate)?.year.toString() ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.captionSmall,
          ),
          onTap: onTap,
        ),
        Divider(
          color: Colors.grey[400],
          height: 1,
          thickness: 0.09,
        ),
      ],
    );
  }
}
