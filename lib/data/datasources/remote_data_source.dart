import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/core/errors/server_exception.dart';
import 'package:movies/data/models/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrendingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> searchMovies(String query);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final http.Client client;

  MovieRemoteDataSourceImpl({required this.client});

  static const String _baseUrl = 'https://api.themoviedb.org/3';
  static const String _apiKey = '1d86e999854334dda7f1dbd97a361294';

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response =
        await client.get(Uri.parse('$_baseUrl/movie/popular?api_key=$_apiKey'));

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      final List<MovieModel> movies = (responseBody['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getTrendingMovies() async {
    final response = await client
        .get(Uri.parse('$_baseUrl/trending/movie/day?api_key=$_apiKey'));

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      final List<MovieModel> movies = (responseBody['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    final response = await client
        .get(Uri.parse('$_baseUrl/search/movie?api_key=$_apiKey&query=$query'));

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      final List<dynamic> movies = responseBody['results'] as List;

      return movies.map((movie) => MovieModel.fromJson(movie)).toList();
    } else {
      throw ServerException();
    }
  }
}
