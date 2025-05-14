// Dart imports:
import 'dart:ui';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:filme_flix/app/common/extensions/build_context_extension.dart';
import 'package:filme_flix/app/common/models/movie.dart';
import 'package:filme_flix/app/core/config/app_config.dart';

class BlurredBackdropImage extends StatelessWidget {
  const BlurredBackdropImage({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: movie.id,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              AppConfig.instance.imageUrl + movie.posterPath,
            ),
            fit: BoxFit.cover,
          ),
        ),
        height: context.height / 1.5,
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.0),
              ),
            )),
      ),
    );
  }
}
