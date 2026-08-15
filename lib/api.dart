import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';

final token = dotenv.env['TMDB_API_TOKEN'];

Future<List<dynamic>> getPopularMovies() async {
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
    throw Exception('Failed to load movies');
  }
}
Future<List<dynamic>> getSearchedMovies(String query) async {
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
    throw Exception('Failed to load movies');
  }
}
