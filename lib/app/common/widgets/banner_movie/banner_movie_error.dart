// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:filme_flix/app/common/styles/text/app_text_styles.dart';

class BannerMovieError extends StatelessWidget {
  final VoidCallback onRetry;

  const BannerMovieError({
    super.key,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      blurRadius: 12,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.image_not_supported_rounded,
                  size: 48,
                  color: Colors.blue[700],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Oops! Unable to load image',
                textAlign: TextAlign.center,
                style: AppTextStyles.h1.copyWith(
                  color: Colors.grey[400],
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'This could be due to a temporary connection issue or the image may no longer be available.',
                textAlign: TextAlign.center,
                style: AppTextStyles.errorMedium,
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh_rounded),
                label: const Text('Try Again'),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
