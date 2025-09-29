import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie_model.dart';
import 'api_constants.dart';

class ApiService {
  static const String _apiKey = ApiConstants.apiKey;
  static const String _baseUrl = 'https://api.themoviedb.org/3';

  Future<List<Movie>> getNowShowingMovies() async {
    final response = await http
        .get(Uri.parse('$_baseUrl/movie/now_playing?api_key=$_apiKey'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['results'] as List;
      return data.map((movieJson) => Movie.fromJson(movieJson)).toList();
    } else {
      throw Exception('Gagal memuat film yang sedang tayang');
    }
  }

  Future<List<Movie>> getComingSoonMovies() async {
    final response =
        await http.get(Uri.parse('$_baseUrl/movie/upcoming?api_key=$_apiKey'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['results'] as List;
      return data.map((movieJson) => Movie.fromJson(movieJson)).toList();
    } else {
      throw Exception('Gagal memuat film yang akan datang');
    }
  }
}
