import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  const MovieList(
      {required this.onTap,
      required this.onFavorite,
      required this.title,
      required this.releaseDate,
      super.key});

  final VoidCallback onTap;
  final VoidCallback onFavorite;
  final String title;
  final String releaseDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          dense: true,
          visualDensity: const VisualDensity(vertical: 4),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
              fit: BoxFit.cover,
              width: 60,
              height: 80,
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          subtitle: Text(
            releaseDate,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey[400],
            ),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.favorite_outline),
            onPressed: onFavorite,
          ),
          onTap: onTap,
        ),
        Divider(
          color: Colors.grey[400],
          height: 1,
          thickness: 0.09,
        ),
      ],
    );
  }
}
