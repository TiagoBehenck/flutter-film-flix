
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:filme_flix/core/app/favorites/store/favorites_bloc.dart';

Widget providers({required Widget child}) {
  return MultiBlocProvider(
    providers: [
      BlocProvider<FavoritesBloc>(
        create: (_) => FavoritesBloc(),
      ),
    ],
    child: child,
  );
}