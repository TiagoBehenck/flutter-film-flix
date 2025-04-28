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
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Expanded(
                child: WatchNowButton(),
              ),
              SizedBox(
                width: 10,
              ),
              FavoriteButton(),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Divider(
            color: Colors.grey[400],
            height: 1,
            thickness: 0.5,
          ),
          const SizedBox(
            height: 16,
          ),
          // Introduction title
          const Text(
            'Introduction',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            movie.overview,
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: 14, color: Colors.white),
          )
        ],
      ),
    );
  }
}
