import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PosterLoading extends StatelessWidget {
  const PosterLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade600,
      highlightColor: Colors.grey.shade500,
      child: Container(
        width: 140,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
