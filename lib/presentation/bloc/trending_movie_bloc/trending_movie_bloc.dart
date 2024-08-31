import 'package:bloc/bloc.dart';
import 'package:movies/domain/usecases/get_trending_movies.dart';
import 'package:movies/presentation/bloc/trending_movie_bloc/trending_movie_event.dart';
import 'package:movies/presentation/bloc/trending_movie_bloc/trending_movie_state.dart';

class TrendingMovieBloc extends Bloc<TrendingMovieEvent, TrendingMovieState> {
  final GetTrendingMovies getTrendingMovies;

  TrendingMovieBloc({required this.getTrendingMovies})
      : super(TrendingMovieInitial()) {
    on<FetchTrendingMovieEvent>((event, emit) async {
      emit(TrendingMovieLoading());

      final result = await getTrendingMovies();

      result.fold(
          (failure) => emit(TrendingMovieError(message: failure.toString())),
          (movies) => emit(TrendingMovieLoaded(movies: movies)));
    });
  }
}
