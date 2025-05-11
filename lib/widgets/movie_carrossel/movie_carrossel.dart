import 'package:filme_flix/core/navigation/routes_constants.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:filme_flix/widgets/movie_card/movie_card.dart';
import 'package:filme_flix/widgets/movie_carrossel/movie_carrossel_empty.dart';
import 'package:filme_flix/widgets/movie_carrossel/movie_carrossel_error.dart';
import 'package:filme_flix/widgets/movie_carrossel/movie_carrossel_loading.dart';
import 'package:filme_flix/common/styles/text/app_text_styles.dart';

class MovieCarrossel extends StatelessWidget {
  const MovieCarrossel({
    required this.titleBold,
    required this.fetchData,
    super.key,
  });

  final String titleBold;
  final Future<List<dynamic>> Function() fetchData;
  
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
            titleBold,
            style: AppTextStyles.h3,
          ),
          const SizedBox(height: 8),
          FutureBuilder(
              future: fetchData(),
              builder: (ctx, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const MovieCarrosselLoading();
                }
                if (snapshot.hasError) {
                  return MovieCarrosselError(onRetry: () => fetchData());
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
