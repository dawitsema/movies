import 'package:bloc/bloc.dart';
import 'package:movies/domain/usecases/get_popular_movies.dart';
import 'package:movies/presentation/bloc/popular_movie_bloc/popular_movie_state.dart';

import 'popular_movie_event.dart';

class PopularMovieBloc extends Bloc<PopularMovieEvent, PopularMovieState> {
  final GetPopularMovies getPopularMovies;

  PopularMovieBloc({required this.getPopularMovies})
      : super(PopularMovieInitial()) {
    on<FetchPopularMovie>((event, emit) async {
      emit(PopularMoviesLoading());

      final result = await getPopularMovies();

      result.fold(
          (failure) => emit(PopularMovieError(message: failure.toString())),
          (movies) => emit(PopularMovieLoaded(movies: movies)));
    });
  }
}
