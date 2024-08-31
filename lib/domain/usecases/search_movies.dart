import 'package:dartz/dartz.dart';
import 'package:movies/core/errors/failure.dart';

import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class SearchMovie {
  final MovieRepository repository;

  SearchMovie(this.repository);

  Future<Either<Failure, List<Movie>>> call(query) async {
    return await repository.searchMovies(query);
  }
}
