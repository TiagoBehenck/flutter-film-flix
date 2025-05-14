// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:filme_flix/app/common/widgets/movie_card/movie_card_loading.dart';

class MovieCarrosselLoading extends StatelessWidget {
  const MovieCarrosselLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (_, index) => const MovieCardLoading()),
    );
  }
}
