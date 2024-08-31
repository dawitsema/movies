import 'package:dartz/dartz.dart';
import 'package:movies/core/errors/failure.dart';

import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class GetTrendingMovies {
  final MovieRepository repository;

  GetTrendingMovies(this.repository);

  Future<Either<Failure, List<Movie>>> call() async {
    return await repository.getTrendingMovies();
  }
}
