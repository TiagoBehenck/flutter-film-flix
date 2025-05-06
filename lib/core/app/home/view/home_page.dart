import 'package:filme_flix/common/extensions/build_context_extension.dart';
import 'package:filme_flix/core/app/home/repository/home_repository.dart';
import 'package:filme_flix/core/app/home/service/home_service.dart';
import 'package:filme_flix/core/http/service/_base/base_service.dart';
import 'package:filme_flix/widgets/banner_movie/banner_movie.dart';
import 'package:filme_flix/widgets/movie_carrossel/movie_carrossel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeRepository _repository;
  late final HomeService _service;

  @override
  void initState() {
    super.initState();
    _service = HomeService(BaseService());
    _repository = HomeRepository(
      _service,
    );
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
              MovieCarrossel(
                categoryTitle: 'Discover',
                fetchData: _repository.getMovies,
              ),
              MovieCarrossel(
                categoryTitle: 'Popular',
                fetchData: _repository.getPopularMovies,
              ),
              MovieCarrossel(
                categoryTitle: 'Top Rated',
                fetchData: _repository.getTopRatedMovies,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
