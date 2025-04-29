import 'dart:ui';

import 'package:filme_flix/app_config.dart';
import 'package:filme_flix/models/movie.dart';
import 'package:flutter/material.dart';

class BlurredBackdropImage extends StatelessWidget {
  const BlurredBackdropImage({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            AppConfig.instance.imageUrl + movie.posterPath,
          ),
          fit: BoxFit.cover,
        ),
      ),
      height: MediaQuery.of(context).size.height / 1.5,
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.0),
            ),
          )),
    );
  }
}