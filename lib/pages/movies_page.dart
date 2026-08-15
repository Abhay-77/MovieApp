import 'dart:async';
import 'package:flutter/material.dart';
import 'movie_info_page.dart';

import '../api.dart';

class MoviesPage extends StatefulWidget {
  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  String searchQuery = '';
  List<dynamic> movies = [];
  List<dynamic> displayedMovies = [];
  bool isLoading = true;
  String? errorMessage;
  final String posterBaseUrl = 'https://image.tmdb.org/t/p/w500';
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  Future<void> loadMovies() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });
    try {
      final fetchedMovies = await getPopularMovies();
      setState(() {
        movies = fetchedMovies;
        displayedMovies = fetchedMovies;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  Future<void> runSearch(String query) async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });
    try {
      final results = await getSearchedMovies(query);
      setState(() {
        displayedMovies = results;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  void onSearchChanged(String value) {
    setState(() {
      searchQuery = value;
    });

    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      if (value.isEmpty) {
        setState(() {
          displayedMovies = movies; // back to popular movies
          errorMessage = null;
        });
        return;
      }
      runSearch(value);
    });
  }

  void retry() {
    if (searchQuery.isEmpty) {
      loadMovies();
    } else {
      runSearch(searchQuery);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search movies...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
            onChanged: onSearchChanged,
          ),
        ),
        Expanded(
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : errorMessage != null
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 48,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          "An error occurred. Please retry.",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: retry,
                        icon: const Icon(Icons.refresh),
                        label: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.65,
                  ),
                  itemCount: displayedMovies.length,
                  itemBuilder: (context, index) {
                    final movie = displayedMovies[index];
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
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
