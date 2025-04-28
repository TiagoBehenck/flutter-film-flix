import 'package:filme_flix/app_config.dart';
import 'package:filme_flix/models/movie.dart';
import 'package:flutter/material.dart';

class CollapsedAppBarContent extends StatelessWidget {
  const CollapsedAppBarContent({
    required this.movie,
    super.key,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            movie.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 40,
          child: Image.network(
            AppConfig.instance.imageUrl +
                (movie.productionCompanies.first.logoPath ?? ''),
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
