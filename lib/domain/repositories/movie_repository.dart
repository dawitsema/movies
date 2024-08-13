import 'package:movies/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getTrendingMovies();
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> searchMovies(String query);
}
