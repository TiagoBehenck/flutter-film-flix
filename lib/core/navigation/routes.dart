import 'package:filme_flix/core/app/detail/view/detail_page.dart';
import 'package:filme_flix/core/app/favorites/view/favorites_page.dart';
import 'package:filme_flix/core/app/home/view/home_page.dart';
import 'package:filme_flix/core/app/search/view/search_page.dart';
import 'package:filme_flix/core/authentication/landing/view/landing_page.dart';
import 'package:filme_flix/core/authentication/login/view/login_page.dart';
import 'package:filme_flix/core/authentication/signup/view/signup_page.dart';
import 'package:filme_flix/core/navigation/routes_constants.dart';
import 'package:filme_flix/models/movie.dart';
import 'package:filme_flix/widgets/navbar/navbar.dart';
import 'package:go_router/go_router.dart';

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
            })
      ])
]);
