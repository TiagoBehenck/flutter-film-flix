// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:filme_flix/app/common/styles/text/app_text_styles.dart';
import 'package:filme_flix/app/modules/dashboard/favorites/store/bloc/favorites_bloc.dart';
import 'package:filme_flix/app/modules/dashboard/favorites/store/events/favorites_events.dart';
import 'package:filme_flix/app/modules/dashboard/favorites/store/state/favorites_state.dart';
import 'package:filme_flix/app/modules/dashboard/favorites/view/error/favorites_error.dart';
import 'package:filme_flix/app/modules/dashboard/favorites/view/loading/favorites_loading.dart';
import 'package:filme_flix/app/modules/dashboard/favorites/view/success/favorites_success.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late final FavoritesBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<FavoritesBloc>();

    _bloc.add(GetFavorites());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          'Favorites',
          style: AppTextStyles.h3,
        ),
      ),
      body: BlocBuilder<FavoritesBloc, FavoritesState>(
        bloc: _bloc,
        builder: (context, state) {
          return switch(state) {
            FavoritesStateLoading() => const FavoritesLoading(),
            FavoritesStateSuccess() => FavoritesSuccess(favoriteMovie: state.favoritesMovies),
            FavoritesStateError() => FavoritesError(onRetry: () => _bloc.add(GetFavorites())),
            _ => const Center(child: Text('No favorites found.'))
          };
        },
      ),
    );
  }
}
