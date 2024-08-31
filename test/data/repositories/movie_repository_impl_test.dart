// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:movies/data/datasources/remote_data_source.dart';
// import 'package:movies/data/models/movie_model.dart';
// import 'package:movies/domain/entities/movie.dart';

// @GenerateMocks([MockSpec<MovieRemoteDataSource>()])
// void main() {
//   late MovieRepositoryImpl repositoryImpl;
//   late MockMovieRemoteDataSource mockRemoteDataSource;

//   setUp(() {
//     mockRemoteDataSource = MockMovieRemoteDataSource();
//     repositoryImpl =
//         MovieRepositoryImpl(remoteDataSource: mockRemoteDataSource);
//   });

//   final tMoviesModel = [
//     MovieModel(
//         id: 'id',
//         title: 'Black Panther',
//         overview: 'overview',
//         posterPath: 'posterPath'),
//     MovieModel(
//         id: 2,
//         title: "Adventin",
//         overview: "overview",
//         posterPath: "posterPath")
//   ];

//   final tMovie = [
//     Movie(
//         id: 1,
//         title: 'Black Panther',
//         overview: 'overview',
//         posterPath: 'posterPath'),
//     Movie(
//         id: 2,
//         title: "Adventin",
//         overview: "overview",
//         posterPath: "posterPath")
//   ];

//   final tQuery = 'Black Panther';

//   test("should get trending movies from the remoted data source", () async {
//     // arrange
//     when(() => mockRemoteDataSource.getTrendingMovies())
//         .thenAnswer((_) async => tMoviesModel);
//     // act
//     final result = await repositoryImpl.getTrendingMovies();
//     // assert
//     verify(() => mockRemoteDataSource.getTrendingMovies());
//     expect(result, equals(tMovie));
//   });

//   test("should get popular movies from the remoted data source", () async {
//     // arrange
//     when(() => mockRemoteDataSource.getPopularMovies())
//         .thenAnswer((_) async => tMoviesModel);
//     // act
//     final result = await repositoryImpl.getPopularMovies();
//     // assert
//     verify(() => mockRemoteDataSource.getPopularMovies());
//     expect(result, equals(tMovie));
//   });

//   test("should get popular movies from the remoted data source", () async {
//     // arrange
//     when(() => mockRemoteDataSource.searchMovies(tQuery))
//         .thenAnswer((_) async => tMoviesModel);
//     // act
//     final result = await repositoryImpl.searchMovies(tQuery);
//     // assert
//     verify(() => mockRemoteDataSource.searchMovies(tQuery));
//     expect(result, equals(tMovie));
//   });
// }
