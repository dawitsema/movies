import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class SearchMovie {
  final MovieRepository repository;

  SearchMovie(this.repository);

  Future<List<Movie>> call(String searchText) async {
    return await repository.searchMovies(searchText);
  }
}
