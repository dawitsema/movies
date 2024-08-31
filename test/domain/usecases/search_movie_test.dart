import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/domain/entities/movie.dart';
import 'package:movies/domain/usecases/search_movies.dart';

import '../../helpers/test_helpers.mocks.dart'; // Ensure this is the correct import

void main() {
  late SearchMovie usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = SearchMovie(mockMovieRepository);
  });

  final tMovieList = [
    Movie(
      id: '1',
      title: 'Movie 1',
      posterPath: 'posterPath 1',
      overview: 'overview 1',
    ),
  ];

  final tQuery = 'query';

  test('should get search movies from the repository', () async {
    // arrange
    when(mockMovieRepository.searchMovies(tQuery))
        .thenAnswer((_) async => Right(tMovieList));

    // act
    final result =
        await usecase(tQuery); // Use .execute() or the actual method name

    // assert
    expect(result, Right(tMovieList));
    verify(mockMovieRepository.searchMovies(tQuery));
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
