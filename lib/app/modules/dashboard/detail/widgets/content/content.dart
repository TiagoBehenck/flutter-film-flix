// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:filme_flix/app/common/models/movie.dart';
import 'package:filme_flix/app/common/styles/text/app_text_styles.dart';
import 'package:filme_flix/app/common/widgets/favorite_button/favorite_button.dart';
import 'package:filme_flix/app/common/widgets/watch_now_button/watch_now_button.dart';
import 'package:filme_flix/app/modules/dashboard/detail/store/detail_bloc.dart';
import 'package:filme_flix/app/modules/dashboard/detail/store/events/detail_events.dart';
import 'package:filme_flix/app/modules/dashboard/detail/store/state/detail_state.dart';
import 'package:filme_flix/app/modules/dashboard/favorites/repository/favorites_repository.dart';
import 'package:filme_flix/app/modules/dashboard/favorites/store/bloc/favorites_bloc.dart';

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
    _detailsBloc = DetailBloc(_favoritesBloc, context.read<FavoritesRepository>());
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
