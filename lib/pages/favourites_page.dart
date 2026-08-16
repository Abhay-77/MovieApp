import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../api.dart';
import 'movie_info_page.dart';

class FavoritesPage extends StatefulWidget {
  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<Map<String, dynamic>> favoriteMovies = [];
  final String posterBaseUrl = 'https://image.tmdb.org/t/p/w500';

  @override
  void initState() {
    super.initState();
    favoriteMovies = getFavoriteMovies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return favoriteMovies.isEmpty
        ? const Center(child: Text('No favorite movies yet.'))
        : GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.65,
            ),
            itemCount: favoriteMovies.length,
            itemBuilder: (context, index) {
              final movie = Map<String, dynamic>.from(favoriteMovies[index]);
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieInfoPage(movie: movie),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: movie['poster_path'] != null
                            ? Image.network(
                                posterBaseUrl + movie['poster_path'],
                                fit: BoxFit.cover,
                                width: double.infinity,
                              )
                            : Container(
                                color: Colors.grey[300],
                                child: const Icon(
                                  Icons.movie,
                                  size: 40,
                                  color: Colors.grey,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      movie['title'] ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${movie['release_date'] ?? ''} • ⭐ ${movie['vote_average'] ?? '-'}',
                      style: TextStyle(color: Colors.grey[600], fontSize: 13),
                    ),
                  ],
                ),
              );
            },
          );
  }
}
