// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:filme_flix/app/common/styles/text/app_text_styles.dart';
import 'package:filme_flix/app/common/widgets/movie_carrossel/empty/movie_carrossel_empty.dart';
import 'package:filme_flix/app/common/widgets/movie_carrossel/error/movie_carrossel_error.dart';
import 'package:filme_flix/app/common/widgets/movie_carrossel/loading/movie_carrossel_loading.dart';
import 'package:filme_flix/app/common/widgets/movie_carrossel/success/movie_carrossel_success.dart';
import 'package:filme_flix/app/core/di/service_locator.dart';
import 'package:filme_flix/app/modules/dashboard/home/enum/movies_categories.dart';
import 'package:filme_flix/app/modules/dashboard/home/store/bloc/home_bloc.dart';
import 'package:filme_flix/app/modules/dashboard/home/store/events/home_events.dart';
import 'package:filme_flix/app/modules/dashboard/home/store/state/home_state.dart';

class MovieCarrossel extends StatefulWidget {
  const MovieCarrossel({
    required this.movieCategory,
    super.key,
  });

  final MoviesCategories movieCategory;

  @override
  State<MovieCarrossel> createState() => _MovieCarrosselState();
}

class _MovieCarrosselState extends State<MovieCarrossel> {
  late HomeBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = sl<HomeBloc>();

    _bloc.add(GetMovies(
      category: widget.movieCategory,
    ));
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.movieCategory.title,
            style: AppTextStyles.h3,
          ),
          const SizedBox(height: 8),
          BlocBuilder<HomeBloc, HomeState>(
            bloc: _bloc,
            builder: (context, state) {
              return switch (state) {
                HomeStateInitial() => const MovieCarrosselEmpty(),
                HomeStateLoading() => const MovieCarrosselLoading(),
                HomeStateError() => MovieCarrosselError(
                    onRetry: () {
                      _bloc.add(GetMovies(
                        category: widget.movieCategory,
                      ));
                    },
                  ),
                HomeStateSuccess() => MovieCarrosselSuccess(
                  movies: state.movies,
                  onLoadMore: () {
                      _bloc.add(GetMovies(
                        category: widget.movieCategory,
                      ));
                    },
                ),
              };
            },
          ),
        ],
      ),
    );
  }
}
