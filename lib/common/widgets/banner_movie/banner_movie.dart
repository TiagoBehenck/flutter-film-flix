import 'package:filme_flix/common/widgets/banner_movie/banner_movie_error.dart';
import 'package:flutter/material.dart';

class BannerMovie extends StatelessWidget {
  const BannerMovie({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/banner.png",
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
          width: double.infinity,
          height: double.infinity,
          errorBuilder: (context, error, stackTrace) {
            return BannerMovieError(
              onRetry: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Trying again...')),
                );
              },
            );
          },
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.transparent,
                  Colors.black.withOpacity(0.7),
                ],
                stops: const [0.0, 0.3, 1.0],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
