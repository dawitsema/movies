import 'package:dartz/dartz.dart';
import 'package:movies/core/errors/failure.dart';
import 'package:movies/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getTrendingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> searchMovies(String query);
}
