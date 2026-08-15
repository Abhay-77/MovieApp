import 'package:flutter/material.dart';

import '../api.dart';

class MoviesPage extends StatefulWidget {
  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  String searchQuery = '';
  List<dynamic> movies = [];
  bool isLoading = true;
  String? errorMessage;
  String posterBaseUrl = 'https://image.tmdb.org/t/p/w500';

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  Future<void> loadMovies() async {
    try {
      final fetchedMovies = await getPopularMovies();
      setState(() {
        movies = fetchedMovies;
        print(movies);
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  // final List<Map<String, dynamic>> movies = [
  //   {
  //     'title': 'Inception',
  //     'year': 2010,
  //     'rating': 8.8,
  //     'poster': 'https://picsum.photos/id/1011/300/450',
  //   },
  //   {
  //     'title': 'Interstellar',
  //     'year': 2014,
  //     'rating': 8.6,
  //     'poster': 'https://picsum.photos/id/1015/300/450',
  //   },
  //   {
  //     'title': 'The Dark Knight',
  //     'year': 2008,
  //     'rating': 9.0,
  //     'poster': 'https://picsum.photos/id/1016/300/450',
  //   },
  //   {
  //     'title': 'Avengers: Endgame',
  //     'year': 2019,
  //     'rating': 8.4,
  //     'poster': 'https://picsum.photos/id/1018/300/450',
  //   },
  //   {
  //     'title': 'Joker',
  //     'year': 2019,
  //     'rating': 8.4,
  //     'poster': 'https://picsum.photos/id/1025/300/450',
  //   },
  //   {
  //     'title': 'Parasite',
  //     'year': 2019,
  //     'rating': 8.5,
  //     'poster': 'https://picsum.photos/id/1035/300/450',
  //   },
  //   {
  //     'title': 'The Matrix',
  //     'year': 1999,
  //     'rating': 8.7,
  //     'poster': 'https://picsum.photos/id/1038/300/450',
  //   },
  //   {
  //     'title': 'Fight Club',
  //     'year': 1999,
  //     'rating': 8.8,
  //     'poster': 'https://picsum.photos/id/1043/300/450',
  //   },
  //   {
  //     'title': 'Pulp Fiction',
  //     'year': 1994,
  //     'rating': 8.9,
  //     'poster': 'https://picsum.photos/id/1050/300/450',
  //   },
  //   {
  //     'title': 'Forrest Gump',
  //     'year': 1994,
  //     'rating': 8.8,
  //     'poster': 'https://picsum.photos/id/1060/300/450',
  //   },
  // ];

  List<dynamic> get filteredMovies {
    if (searchQuery.isEmpty) {
      return movies;
    } else {
      return movies
          .where(
            (movie) => movie['title'].toLowerCase().contains(
              searchQuery.toLowerCase(),
            ),
          )
          .toList();
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
            onChanged: (value) {
              setState(() {
                searchQuery = value;
              });
            },
          ),
        ),

        Expanded(
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : errorMessage != null
              ? Center(child: Text(errorMessage!))
              : GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.65,
                  ),
                  itemCount: filteredMovies.length,
                  itemBuilder: (context, index) {
                    final movie = filteredMovies[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              posterBaseUrl + movie['poster_path'],
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
                          '${movie['release_date']} • ⭐ ${movie['vote_count']}',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 13,
                          ),
                        ),
                      ],
                    );
                  },
                ),
        ),
      ],
    );
  }
}
