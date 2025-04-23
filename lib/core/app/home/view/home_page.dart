import 'package:filme_flix/common/extensions/build_context_extension.dart';
import 'package:filme_flix/widgets/banner_movie/banner_movie.dart';
import 'package:filme_flix/widgets/movie_carrossel/movie_carrossel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light, 
            ),
            backgroundColor: Colors.transparent,
            expandedHeight: context.height * 0.6,
            pinned: true,
            floating: true,
            snap: true, 
            elevation: 0,
            toolbarHeight: 0,
            collapsedHeight: kToolbarHeight,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // Imagem de fundo
                  const Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      child: BannerMovie(),
                    ),
                  ),
                  // Opcional: Gradiente para melhorar a visibilidade do título
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                     Colors.black.withOpacity(0.6), // Mais escuro no topo para a AppBar
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
                          ],
                          stops: const [0.0, 0.3, 1.0],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
                categoryTitle: 'New Arrivals',
              ),
              // Outros widgets aqui
            ]),
          ),
        ],
      ),
    );
  }
}
