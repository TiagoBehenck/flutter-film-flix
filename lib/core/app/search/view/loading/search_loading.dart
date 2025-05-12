import 'package:flutter/material.dart';

class SearchLoading extends StatelessWidget {
  const SearchLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
  
}