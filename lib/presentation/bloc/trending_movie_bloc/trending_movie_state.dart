import 'package:movies/domain/entities/movie.dart';

abstract class TrendingMovieState {}

class TrendingMovieInitial extends TrendingMovieState {}

class TrendingMovieLoading extends TrendingMovieState {}

class TrendingMovieLoaded extends TrendingMovieState {
  final List<Movie> movies;

  TrendingMovieLoaded({required this.movies});
}

class TrendingMovieError extends TrendingMovieState {
  final String message;

  TrendingMovieError({required this.message});
}
