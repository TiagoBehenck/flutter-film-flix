
import 'package:filme_flix/core/app/detail/store/detail_bloc.dart';
import 'package:filme_flix/core/app/favorites/repository/favorites_repository.dart';
import 'package:filme_flix/core/app/home/repository/home_repository.dart';
import 'package:filme_flix/core/app/home/store/bloc/home_bloc.dart';
import 'package:filme_flix/core/app/search/repository/search_repository.dart';
import 'package:filme_flix/core/app/search/store/bloc/search_bloc.dart';
import 'package:filme_flix/core/di/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:filme_flix/core/app/favorites/store/bloc/favorites_bloc.dart';

Widget providers({
  required Widget child,
}) {
  return MultiBlocProvider(
    providers: [
      BlocProvider<FavoritesBloc>(
        create: (_) => FavoritesBloc(
          sl<FavoritesRepository>(),
        ),
      ),
      BlocProvider<SearchBloc>(
        create: (_) => SearchBloc(
          sl<SearchRepository>(),
        ),
      ),
      BlocProvider<HomeBloc>(
        create: (_) => HomeBloc(
          sl<HomeRepository>(),
        ),
      ),
      BlocProvider<DetailBloc>(
        create: (_) => DetailBloc(
          sl<FavoritesBloc>(),
          sl<FavoritesRepository>(),
        ),
      ),
    ],
    child: child,
  );
}