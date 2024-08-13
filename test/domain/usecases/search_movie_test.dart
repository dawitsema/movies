import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/domain/entities/movie.dart';
import 'package:movies/domain/usecases/search_movies.dart';

import '../../helpers/test_helpers.mocks.dart';

void main() {
  late SearchMovie usecases;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecases = SearchMovie(mockMovieRepository);
  });

  final tMovieList = [
    Movie(
        id: 1,
        title: 'Movie 1',
        posterPath: 'posterPath 1',
        overview: 'overview 1'),
  ];

  final tQuery = 'query';

  test('should get search movies from the repository', () async {
    // arrange
    when(mockMovieRepository.searchMovies(tQuery))
        .thenAnswer((_) async => tMovieList);

    // act
    final result = await usecases(tQuery);

    // assert
    expect(result, tMovieList);
    verify(mockMovieRepository.searchMovies(tQuery));
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
