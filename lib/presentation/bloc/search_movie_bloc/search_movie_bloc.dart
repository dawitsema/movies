import 'package:bloc/bloc.dart';
import 'package:movies/domain/usecases/search_movies.dart';
import 'package:movies/presentation/bloc/search_movie_bloc/search_movie_event.dart';
import 'package:movies/presentation/bloc/search_movie_bloc/search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final SearchMovie searchMovie;

  SearchMovieBloc({required this.searchMovie}) : super(SearchMovieInitial()) {
    on<FetchSearchMovie>((event, emit) async {
      emit(SearchMovieInitial());

      final result = await searchMovie(event.query);

      result.fold(
          (failure) => emit(SearchMovieError(message: failure.toString())),
          (movies) => emit(SearchMovieLoaded(movies: movies)));
    });
  }
}
