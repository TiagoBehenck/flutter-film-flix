import 'package:filme_flix/widgets/search_input/search_input.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text(
        'Search',
        style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        ),
      ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
        children: [
          SearchInput(),
          Expanded(
          child: Center(
            child: Text('Search results will appear here'),
          ),
          ),
        ],
        ),
      ),
    );
  }
}