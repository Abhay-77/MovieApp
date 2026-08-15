import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  final List<Map<String, dynamic>> favoriteMovies = [
    {
      'title': 'Inception',
      'year': 2010,
      'rating': 8.8,
      'poster': 'https://picsum.photos/id/1011/300/450',
    },
    {
      'title': 'Interstellar',
      'year': 2014,
      'rating': 8.6,
      'poster': 'https://picsum.photos/id/1015/300/450',
    },
    {
      'title': 'The Dark Knight',
      'year': 2008,
      'rating': 9.0,
      'poster': 'https://picsum.photos/id/1016/300/450',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.65,
      ),
      itemCount: favoriteMovies.length,
      itemBuilder: (context, index) {
        final movie = favoriteMovies[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  movie['poster'],
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              movie['title'],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '${movie['year']} • ⭐ ${movie['rating']}',
              style: TextStyle(color: Colors.grey[600], fontSize: 13),
            ),
          ],
        );
      },
    );
  }
}
