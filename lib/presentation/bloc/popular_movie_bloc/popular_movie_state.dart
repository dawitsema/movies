import 'package:movies/domain/entities/movie.dart';

abstract class PopularMovieState {}

class PopularMovieInitial extends PopularMovieState {}

class PopularMoviesLoading extends PopularMovieState {}

class PopularMovieLoaded extends PopularMovieState {
  final List<Movie> movies;

  PopularMovieLoaded({required this.movies});
}

class PopularMovieError extends PopularMovieState {
  final String message;

  PopularMovieError({required this.message});
}
