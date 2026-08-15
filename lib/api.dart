import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';

Future<List<dynamic>> getPopularMovies() async {
  final token = dotenv.env['TMDB_API_TOKEN'];

  final response = await http.get(
    Uri.parse('https://api.themoviedb.org/3/movie/popular'),
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data['results']; // list of movies
  } else {
    throw Exception('Failed to load movies');
  }
}
