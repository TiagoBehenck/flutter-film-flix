// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:filme_flix/app/common/models/movie.dart';
import 'package:filme_flix/app/common/styles/text/app_text_styles.dart';
import 'package:filme_flix/app/core/config/app_config.dart';

class CollapsedAppBarContent extends StatelessWidget {
  const CollapsedAppBarContent({
    required this.movie,
    super.key,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Expanded(
        child: Text(
        movie.title,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: AppTextStyles.h3,
        ),
      ),
      SizedBox(
        height: 40,
        child: Image.network(
        AppConfig.instance.imageUrl +
          (movie.productionCompanies.first.logoPath ?? ''),
        fit: BoxFit.cover,
        ),
      ),
      ],
    );
  }
}
