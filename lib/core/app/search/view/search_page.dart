import 'package:filme_flix/widgets/movie_list/movie_list.dart';
import 'package:filme_flix/widgets/search_input/search_input.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Text(
          'Search',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            const SearchInput(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return MovieList(
                      releaseDate: '2023-10-01',
                      title: 'Movie Title',
                      onTap: () {},
                      onFavorite: () {},
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
