import 'package:flutter/material.dart';

class MovieCardError extends StatelessWidget {
  const MovieCardError({
    super.key,
    required this.onRetry,
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
          const Text(
            'Something went wrong!',
            style: TextStyle(fontSize: 16.0, color: Colors.black54),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: onRetry,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
