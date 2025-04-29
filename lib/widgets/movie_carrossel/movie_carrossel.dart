import 'package:filme_flix/core/navigation/routes_constants.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:filme_flix/repositories/movie_repository.dart';
import 'package:filme_flix/widgets/movie_card/movie_card.dart';
import 'package:filme_flix/widgets/movie_carrossel/movie_carrossel_empty.dart';
import 'package:filme_flix/widgets/movie_carrossel/movie_carrossel_error.dart';
import 'package:filme_flix/widgets/movie_carrossel/movie_carrossel_loading.dart';

class MovieCarrossel extends StatelessWidget {
  const MovieCarrossel({
    required this.categoryTitle,
    super.key,
  });

  final String categoryTitle;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            categoryTitle,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          FutureBuilder(
              future: MovieRepository().getMovies(),
              builder: (ctx, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const MovieCarrosselLoading();
                }
                if (snapshot.hasError) {
                  return MovieCarrosselError(onRetry: () => MovieRepository().getMovies());
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const MovieCarrosselEmpty();
                }

                final movies = snapshot.data ?? [];                

                return SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return MovieCard(
                        movie: movies[index],
                        onTap: (){
                         context.push(
                            RoutesConstants.detail,
                            extra: movies[index],
                          );
                        },
                      );
                    },
                  ),
                );
              })
        ],
      ),
    );
  }
}
