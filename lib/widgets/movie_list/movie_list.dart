import 'package:filme_flix/app_config.dart';
import 'package:filme_flix/models/movie.dart';
import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  const MovieList(
      {required this.onTap,
      required this.onFavorite,
      required this.movie,
      super.key});

  final VoidCallback onTap;
  final VoidCallback onFavorite;
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
            child: Image.network(
             AppConfig.instance.imageUrl + movie.posterPath,
              fit: BoxFit.cover,
              width: 60,
              height: 80,
            ),
          ),
          title: Text(
            movie.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          subtitle: Text(
            DateTime.tryParse(movie.releaseDate)?.year.toString() ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey[400],
            ),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.favorite_outline),
            onPressed: onFavorite,
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
