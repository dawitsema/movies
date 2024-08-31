import 'package:dartz/dartz.dart';
import 'package:movies/core/errors/failure.dart';
import 'package:movies/core/network/network_info.dart';
import 'package:movies/data/models/movie_model.dart';

import '../../domain/repositories/movie_repository.dart';
import '../datasources/remote_data_source.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource movieRemoteDataSource;
  final NetworkInfo networkInfo;

  MovieRepositoryImpl({
    required this.movieRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<MovieModel>>> getPopularMovies() async {
    if (await networkInfo.isConnected) {
      try {
        final movies = await movieRemoteDataSource.getPopularMovies();
        return Right(movies);
      } catch (e) {
        return Left(ServerFailure("Server Failure"));
      }
    } else {
      return Left(ServerFailure("No Internet Connection"));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getTrendingMovies() async {
    if (await networkInfo.isConnected) {
      try {
        final movies = await movieRemoteDataSource.getTrendingMovies();
        return Right(movies);
      } catch (e) {
        return Left(ServerFailure("Server Failure"));
      }
    } else {
      return Left(ServerFailure("No Internet Connection"));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> searchMovies(String query) async {
    if (await networkInfo.isConnected) {
      try {
        final Movies = await movieRemoteDataSource.searchMovies(query);
        return Right(Movies);
      } catch (e) {
        return Left(ServerFailure("Server Failure"));
      }
    } else {
      return Left(ServerFailure("No Internet Connection"));
    }
  }
}
