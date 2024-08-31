import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/domain/entities/movie.dart';
import 'package:movies/domain/usecases/get_trending_movies.dart';

import '../../helpers/test_helpers.mocks.dart';

void main() {
  late GetTrendingMovies usecases;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecases = GetTrendingMovies(mockMovieRepository);
  });

  final tMovieList = [
    Movie(
        id: '1',
        title: 'Movie 1',
        posterPath: 'posterPath 1',
        overview: 'overview 1'),
  ];

  test('should get trending movies from the repository', () async {
    // arrange
    when(mockMovieRepository.getTrendingMovies())
        .thenAnswer((_) async => Right(tMovieList));

    // act
    final result = await usecases();

    // assert
    expect(result, Right(tMovieList));
    verify(mockMovieRepository.getTrendingMovies());
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
