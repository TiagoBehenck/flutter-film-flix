import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    required this.onPressed,
    required this.isFavorite,
    super.key,
  });

  final VoidCallback onPressed;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.0,
      child: OutlinedButton(
        onPressed: onPressed,
        child: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_outline,
          color: Colors.white,
        ),
      ),
    );
  }
}