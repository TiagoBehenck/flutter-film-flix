import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:filme_flix/core/app/favorites/store/events/favorites_events.dart';
import 'package:filme_flix/core/app/favorites/store/favorites_bloc.dart';
import 'package:filme_flix/core/app/favorites/store/state/favorites_state.dart';

import 'package:filme_flix/core/app/favorites/view/success/favorites_success.dart';
import 'package:filme_flix/core/app/favorites/view/loading/favorites_loading.dart';
import 'package:filme_flix/core/app/favorites/view/error/favorites_error.dart';
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
        title: const Text(
          'Favorites',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
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
