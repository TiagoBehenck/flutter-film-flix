import 'package:filme_flix/common/styles/text/app_text_styles.dart';
import 'package:flutter/material.dart';

class FavoritesError extends StatelessWidget {
  const FavoritesError({
    required this.onRetry,
    super.key,
  });

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error,
            color: Colors.redAccent,
            size: 48.0,
          ),
          const SizedBox(height: 16.0),
          Text(
            'Something went wrong!',
            style: AppTextStyles.errorMedium
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onRetry,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
