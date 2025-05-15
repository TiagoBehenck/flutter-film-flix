// Package imports:
import 'package:get_it/get_it.dart';

// Project imports:
import 'package:filme_flix/app/common/infra/db/storage.dart';
import 'package:filme_flix/app/core/client/http/service/_base/base_service.dart';
import 'package:filme_flix/app/modules/dashboard/detail/repository/detail_repository.dart';
import 'package:filme_flix/app/modules/dashboard/detail/service/detail_service.dart';
import 'package:filme_flix/app/modules/dashboard/detail/store/detail_bloc.dart';
import 'package:filme_flix/app/modules/dashboard/favorites/repository/favorites_repository.dart';
import 'package:filme_flix/app/modules/dashboard/favorites/service/favorites_service.dart';
import 'package:filme_flix/app/modules/dashboard/favorites/store/bloc/favorites_bloc.dart';
import 'package:filme_flix/app/modules/dashboard/home/repository/home_repository.dart';
import 'package:filme_flix/app/modules/dashboard/home/service/home_service.dart';
import 'package:filme_flix/app/modules/dashboard/home/store/bloc/home_bloc.dart';
import 'package:filme_flix/app/modules/dashboard/search/repository/search_repository.dart';
import 'package:filme_flix/app/modules/dashboard/search/service/search_service.dart';
import 'package:filme_flix/app/modules/dashboard/search/store/bloc/search_bloc.dart';

final sl = GetIt.instance;

Future<void> configureDependencies() async {
  sl.registerLazySingleton<BaseService>(() => BaseService());
  sl.registerLazySingleton<Storage>(() => Storage());

  // search
  sl.registerFactory<SearchService>(() => SearchService(
        sl<BaseService>(),
      ));
  sl.registerFactory<SearchRepository>(() => SearchRepository(
        sl<SearchService>(),
      ));
  sl.registerFactory<SearchBloc>(() => SearchBloc(
        sl<SearchRepository>(),
      ));

  // home
  sl.registerLazySingleton<HomeService>(() => HomeService(
        sl<BaseService>(),
      ));
  sl.registerLazySingleton<HomeRepository>(() => HomeRepository(
        sl<HomeService>(),
      ));
  sl.registerFactory<HomeBloc>(() => HomeBloc(
        sl<HomeRepository>(),
      ));

  // favorites
  sl.registerFactory<FavoritesService>(() => FavoritesService(
        sl<Storage>(),
      ));
  sl.registerFactory<FavoritesRepository>(() => FavoritesRepository(
        sl<FavoritesService>(),
      ));
  sl.registerFactory<FavoritesBloc>(() => FavoritesBloc(
        sl<FavoritesRepository>(),
      ));

  // detail
  sl.registerFactory<DetailService>(() => DetailService(
        sl<BaseService>(),
      ));
  sl.registerFactory<DetailRepository>(() => DetailRepository(
        sl<DetailService>(),
      ));
  sl.registerFactory(() => DetailBloc(
        sl<FavoritesBloc>(),
        sl<FavoritesRepository>(),
      ));

  await sl.allReady();
}
