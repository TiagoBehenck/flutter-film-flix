import 'package:filme_flix/common/styles/text/app_text_styles.dart';
import 'package:filme_flix/core/app/detail/store/detail_bloc.dart';
import 'package:filme_flix/core/app/detail/store/events/detail_events.dart';
import 'package:filme_flix/core/app/detail/store/state/detail_state.dart';
import 'package:filme_flix/core/app/favorites/store/bloc/favorites_bloc.dart';
import 'package:filme_flix/common/models/movie.dart';
import 'package:filme_flix/common/widgets/favorite_button/favorite_button.dart';
import 'package:filme_flix/common/widgets/watch_now_button/watch_now_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Content extends StatefulWidget {
  final Movie movie;

  const Content({
    required this.movie,
    super.key,
  });

  @override
  State<Content> createState() => _Content();
}

class _Content extends State<Content> {
  late FavoritesBloc _favoritesBloc;
  late DetailBloc _detailsBloc;
  late Movie movie = widget.movie;

  @override
  void initState() {
    super.initState();

    _favoritesBloc = context.read<FavoritesBloc>();
    _detailsBloc = DetailBloc(favoritesBloc: _favoritesBloc);
    _detailsBloc.add(GetIsFavoriteMovie(movie: movie));
  }

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
              BlocBuilder<DetailBloc, DetailState>(
                bloc: _detailsBloc,
                builder: (context, state) {
                  return switch (state) {
                    DetailStateStateSuccess() => FavoriteButton(
                        isFavorite: state.isFavoriteMovie,
                        onPressed: () {
                          _detailsBloc.add(ToggleFavoriteMovie(movie: movie));
                        },
                      ),
                    _ => const SizedBox.shrink(),
                  };
                },
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            movie.genres.map((genre) => genre.name).join(', '),
            style: AppTextStyles.captionSmall,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            movie.overview,
            textAlign: TextAlign.justify,
            style: AppTextStyles.bodySmall,
          )
        ],
      ),
    );
  }
}
