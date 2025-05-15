// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:filme_flix/app/common/styles/text/app_text_styles.dart';

class MovieCarrosselEmpty extends StatelessWidget {
  const MovieCarrosselEmpty({
    this.message,
    super.key,
  });

  final String? message;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.sentiment_dissatisfied,
              size: 48,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 8),
            Text(
              message ?? 'No movies found',
              style:  AppTextStyles.errorMedium.copyWith(
                fontSize: 20,
                color: const Color(0xffBBBBBB)
              ),
              textAlign: TextAlign.center,
              
            ),
          ],
        ),
      ),
    );
  }
}
