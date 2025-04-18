import 'package:filme_flix/widgets/banner_movie/banner_movie.dart';
import 'package:filme_flix/widgets/movie_carrossel/movie_carrossel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BannerMovie(
              src:
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
            ),
            MovieCarrossel(
              categoryTitle: 'New Arrivals',
              imageUrl:
                  'https://picsum.photos/120/180',
            ),
          ],
        ),
      ),
    );
  }
}
