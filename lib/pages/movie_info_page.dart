import 'package:flutter/material.dart';

class MovieInfoPage extends StatelessWidget {
  final Map<String, dynamic> movie;
  final String posterBaseUrl = 'https://image.tmdb.org/t/p/w500';

  MovieInfoPage({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie['title'])),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: movie['poster_path'] != null
                  ? Image.network(
                      posterBaseUrl + movie['poster_path'],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    )
                  : Container(
                      height: 300,
                      color: Colors.grey[300],
                      child: const Icon(
                        Icons.movie,
                        size: 60,
                        color: Colors.grey,
                      ),
                    ),
            ),
            movie['adult'] == true
                ? const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Adult Content',
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  )
                : const SizedBox.shrink(),
            const SizedBox(height: 12),
            Text(
              'Title: ${movie['title']}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 8),
            Text(
              'Year: ${movie['release_date']}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Rating: ${movie['vote_average'].toStringAsFixed(1)} / 10',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              'Overview:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(movie['overview'], style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
