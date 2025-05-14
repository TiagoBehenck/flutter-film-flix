// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:filme_flix/app/common/models/movie.dart';
import 'package:filme_flix/app/common/widgets/navbar/navbar.dart';
import 'package:filme_flix/app/core/navigation/routes_constants.dart';
import 'package:filme_flix/app/modules/authentication/landing/view/landing_page.dart';
import 'package:filme_flix/app/modules/authentication/login/view/login_page.dart';
import 'package:filme_flix/app/modules/authentication/signup/view/signup_page.dart';
import 'package:filme_flix/app/modules/dashboard/detail/view/detail_page.dart';
import 'package:filme_flix/app/modules/dashboard/favorites/view/favorites_page.dart';
import 'package:filme_flix/app/modules/dashboard/home/view/home_page.dart';
import 'package:filme_flix/app/modules/dashboard/search/view/search_page.dart';
import 'package:filme_flix/app/modules/dashboard/settings/view/settings_page.dart';

final router = GoRouter(initialLocation: RoutesConstants.landing, routes: [
  GoRoute(
      path: RoutesConstants.landing,
      builder: (context, state) {
        return const LandingPage();
      }),
  GoRoute(
      path: RoutesConstants.login,
      builder: (context, state) {
        return const LoginPage();
      }),
  GoRoute(
      path: RoutesConstants.signup,
      builder: (context, state) {
        return const SignUpPage();
      }),
  GoRoute(
      path: RoutesConstants.detail,
      builder: (context, state) {
        final movie = state.extra as Movie;
        return DetailPage(movie: movie);
      }),
  ShellRoute(
      builder: (context, state, child) {
        int? index;

        if (state.extra is int) {
          index = state.extra as int;
        }

        return NavBar(
          index: index ?? 0,
          child: child,
        );
      },
      routes: [
        GoRoute(
            path: RoutesConstants.home,
            builder: (context, state) {
              return const HomePage();
            }),
        GoRoute(
            path: RoutesConstants.search,
            builder: (context, state) {
              return const SearchPage();
            }),
        GoRoute(
            path: RoutesConstants.favorites,
            builder: (context, state) {
              return const FavoritesPage();
            }),
        GoRoute(
            path: RoutesConstants.settings,
            builder: (context, state) {
              return const SettingsPage();
            })
      ])
]);
