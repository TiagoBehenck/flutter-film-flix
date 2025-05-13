import 'package:filme_flix/common/http/service/_base/base_service.dart';
import 'package:filme_flix/core/app/search/repository/search_repository.dart';
import 'package:filme_flix/core/app/search/service/search_service.dart';
import 'package:filme_flix/core/app/search/store/bloc/search_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> configureDependencies() async {
  sl.registerLazySingleton<BaseService>(() => BaseService());

  // search
  sl.registerLazySingleton<SearchService>(() => SearchService(
    sl<BaseService>(),
  ));
  sl.registerLazySingleton<SearchRepository>(() => SearchRepository(
    sl<SearchService>(),
  ));
  sl.registerLazySingleton<SearchBloc>(() => SearchBloc(
    sl<SearchRepository>(),
  ));

  await sl.allReady();
}
