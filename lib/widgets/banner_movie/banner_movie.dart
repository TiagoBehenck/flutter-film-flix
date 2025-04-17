import 'package:filme_flix/widgets/banner_movie/banner_movie_error.dart';
import 'package:flutter/material.dart';

class BannerMovie extends StatelessWidget {
  const BannerMovie({
    super.key,
    required this.src,
  });
  final String src;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * 0.6,
      width: double.infinity,
      child: Image.network(
        src,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
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
    );
  }
}
