import 'package:filme_flix/models/movie.dart';
import 'package:filme_flix/widgets/favorite_button/favorite_button.dart';
import 'package:filme_flix/widgets/watch_now_button/watch_now_button.dart';
import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  const Content({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: WatchNowButton(
                  homepageUrl: movie.homepage,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const FavoriteButton(),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            movie.genres.map((genre) => genre.name).join(', '),
            style: const TextStyle(
              color: Color(0xff969696),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
           const SizedBox(
            height: 8,
          ),
            Text(
            movie.overview,
            textAlign: TextAlign.justify,
            style: const TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.w400),
            )
        ],
      ),
    );
  }
}
