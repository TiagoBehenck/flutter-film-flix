// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:filme_flix/app/common/extensions/build_context_extension.dart';
import 'package:filme_flix/app/common/widgets/banner_movie/banner_movie.dart';
import 'package:filme_flix/app/common/widgets/movie_carrossel/movie_carrossel.dart';
import 'package:filme_flix/app/modules/dashboard/home/enum/movies_categories.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: context.height * 0.55,
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
              const MovieCarrossel(
                movieCategory: MoviesCategories.popular,
              ),
              const MovieCarrossel(
                movieCategory: MoviesCategories.inTheaters
              ),
              const MovieCarrossel(
                movieCategory: MoviesCategories.topRated
              ),
              const MovieCarrossel(
                movieCategory: MoviesCategories.discover
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
