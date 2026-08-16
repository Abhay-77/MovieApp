import 'package:flutter/material.dart';

import '../api.dart';

class MovieInfoPage extends StatefulWidget {
  final Map<String, dynamic> movie;
  final String posterBaseUrl = 'https://image.tmdb.org/t/p/w500';

  MovieInfoPage({required this.movie});

  @override
  State<MovieInfoPage> createState() => _MovieInfoPageState();
}

class _MovieInfoPageState extends State<MovieInfoPage> {
  int get movieId => int.tryParse(widget.movie['id']?.toString() ?? '') ?? -1;

  @override
  Widget build(BuildContext context) {
    final isFav = isFavorite(movieId);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie['title']),
        actions: [
          IconButton(
            onPressed: () {
              toggleFavourite(widget.movie);
              setState(() {});
            },
            icon: Icon(
              isFav ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
              size: 30,
            ),
            tooltip: isFav ? 'Remove from favorites' : 'Add to favorites',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: widget.movie['poster_path'] != null
                  ? Image.network(
                      widget.posterBaseUrl + widget.movie['poster_path'],
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
            widget.movie['adult'] == true
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
              'Title: ${widget.movie['title']}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 8),
            Text(
              'Year: ${widget.movie['release_date']}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Rating: ${widget.movie['vote_average']?.toStringAsFixed(1) ?? 'N/A'} / 10',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              'Overview:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              widget.movie['overview'] ?? '',
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
