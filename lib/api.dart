import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';
import 'package:hive/hive.dart';

late Box<dynamic> favoritesBox;

String? get tmdbApiToken => dotenv.env['TMDB_API_TOKEN'];

Future<List<dynamic>> getPopularMovies() async {
  final token = tmdbApiToken;

  if (token == null || token.isEmpty) {
    throw Exception('TMDB_API_TOKEN is missing. Add it to your .env file.');
  }

  final response = await http.get(
    Uri.parse('https://api.themoviedb.org/3/movie/popular'),
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data['results'];
  } else {
    throw Exception('Failed to load movies: ${response.statusCode}');
  }
}

Future<List<dynamic>> getSearchedMovies(String query) async {
  final token = tmdbApiToken;

  if (token == null || token.isEmpty) {
    throw Exception('TMDB_API_TOKEN is missing. Add it to your .env file.');
  }

  final response = await http.get(
    Uri.parse(
      'https://api.themoviedb.org/3/search/movie?query=${Uri.encodeQueryComponent(query)}',
    ),
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data['results'];
  } else {
    throw Exception('Failed to load movies: ${response.statusCode}');
  }
}

void toggleFavourite(Map<String, dynamic> movie) {
  final id = movie['id'].toString();
  final normalizedMovie = Map<String, dynamic>.from(movie);

  if (favoritesBox.containsKey(id)) {
    favoritesBox.delete(id);
  } else {
    favoritesBox.put(id, normalizedMovie);
  }
}

bool isFavorite(int movieId) {
  return favoritesBox.containsKey(movieId.toString());
}

List<Map<String, dynamic>> getFavoriteMovies() {
  return favoritesBox.values
      .map((movie) => Map<String, dynamic>.from(movie as Map))
      .toList();
}
