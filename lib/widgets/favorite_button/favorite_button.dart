import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.0,
      child: OutlinedButton(
        child: const Icon(
          Icons.favorite_outline,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
    );
  }
}