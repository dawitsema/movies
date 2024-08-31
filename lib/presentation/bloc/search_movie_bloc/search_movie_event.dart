abstract class SearchMovieEvent {}

class FetchSearchMovie extends SearchMovieEvent {
  final String query;

  FetchSearchMovie({required this.query});
}
