// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:filme_flix/app/core/di/service_locator.dart';
import 'package:filme_flix/app/modules/dashboard/detail/store/detail_bloc.dart';
import 'package:filme_flix/app/modules/dashboard/favorites/repository/favorites_repository.dart';
import 'package:filme_flix/app/modules/dashboard/favorites/store/bloc/favorites_bloc.dart';
import 'package:filme_flix/app/modules/dashboard/home/repository/home_repository.dart';
import 'package:filme_flix/app/modules/dashboard/home/store/bloc/home_bloc.dart';
import 'package:filme_flix/app/modules/dashboard/search/repository/search_repository.dart';
import 'package:filme_flix/app/modules/dashboard/search/store/bloc/search_bloc.dart';

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
