import 'package:filme_flix/common/extensions/build_context_extension.dart';
import 'package:filme_flix/repositories/movie_repository.dart';
import 'package:filme_flix/widgets/banner_movie/banner_movie.dart';
import 'package:filme_flix/widgets/movie_carrossel/movie_carrossel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: context.height * 0.6,
            pinned: true,
            elevation: 0,
            floating: false,
            stretch: true,
            forceMaterialTransparency: true,
            collapsedHeight: kToolbarHeight,
            flexibleSpace: const FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              stretchModes: [
                StretchMode.zoomBackground,
              ],
              background: BannerMovie(),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 8,
              color: Colors.transparent,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              MovieCarrossel(
                categoryTitle: 'Discover',
                fetchData: MovieRepository().getMovies,
              ),
              MovieCarrossel(
                categoryTitle: 'Top Rated',
                fetchData: MovieRepository().getTopRatedMovies,
              ),
              MovieCarrossel(
                categoryTitle: 'Popular',
                fetchData: MovieRepository().getPopularMovies,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
