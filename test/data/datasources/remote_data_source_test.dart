import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/core/errors/server_exception.dart';
import 'package:movies/data/datasources/remote_data_source.dart';
import 'package:movies/data/models/movie_model.dart';

import 'remote_data_source_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MovieRemoteDataSourceImpl dataSource;
  late MockClient mockHttpClient; // Ensure correct import

  setUp(() {
    mockHttpClient = MockClient(); // Ensure correct mock class name
    dataSource = MovieRemoteDataSourceImpl(client: mockHttpClient);
  });

  final String query = 'Black Panther';

  const String sampleJson = '''{
    "page": 1,
    "results": [
        {
            "adult": false,
            "backdrop_path": "/b6ZJZHUdMEFECvGiDpJjlfUWela.jpg",
            "genre_ids": [
                28,
                12,
                878
            ],
            "id": 284054,
            "original_language": "en",
            "original_title": "Black Panther",
            "overview": "King T'Challa returns home to the reclusive, technologically advanced African nation of Wakanda to serve as his country's new leader. However, T'Challa soon finds that he is challenged for the throne by factions within his own country as well as without. Using powers reserved to Wakandan kings, T'Challa assumes the Black Panther mantle to join with ex-girlfriend Nakia, the queen-mother, his princess-kid sister, members of the Dora Milaje (the Wakandan 'special forces') and an American secret agent, to prevent Wakanda from being dragged into a world war.",
            "popularity": 86.776,
            "poster_path": "/uxzzxijgPIY7slzFvMotPv8wjKA.jpg",
            "release_date": "2018-02-13",
            "title": "Black Panther",
            "video": false,
            "vote_average": 7.385,
            "vote_count": 21896
        }
    ]
  }''';

  const tUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=1d86e999854334dda7f1dbd97a361294';

  const pUrl =
      'https://api.themoviedb.org/3/movie/popular?api_key=1d86e999854334dda7f1dbd97a361294';

  final searchUrl =
      'https://api.themoviedb.org/3/search/movie?api_key=1d86e999854334dda7f1dbd97a361294&query=$query';

  test('should perform a get request on the url to get trending movies',
      () async {
    // arrange
    when(mockHttpClient.get(Uri.parse(tUrl)))
        .thenAnswer((_) async => http.Response(sampleJson, 200));

    // act
    final result = await dataSource.getTrendingMovies();

    // assert
    verify(mockHttpClient.get(Uri.parse(tUrl)));
    expect(result, isA<List<MovieModel>>()); // Add assertion on the result
  });

  test('should perform a get request on the url to get popular movies',
      () async {
    // arrange
    when(mockHttpClient.get(Uri.parse(pUrl)))
        .thenAnswer((_) async => http.Response(sampleJson, 200));

    // act
    final result = await dataSource.getPopularMovies();

    // assert
    verify(mockHttpClient.get(Uri.parse(pUrl)));
    expect(result, isA<List<MovieModel>>()); // Add assertion on the result
  });

  test('should perform a GET request on the URL to search movies by query',
      () async {
    // arrange
    when(mockHttpClient.get(Uri.parse(searchUrl)))
        .thenAnswer((_) async => http.Response(sampleJson, 200));

    // act
    final result = await dataSource.searchMovies(query);

    // assert
    verify(mockHttpClient.get(Uri.parse(searchUrl)));
    expect(result, isA<List<MovieModel>>()); // Add assertion on the result
  });

  test('should throw a server exception when the response code is not 200',
      () async {
    // arrange
    when(mockHttpClient.get(Uri.parse(tUrl)))
        .thenAnswer((_) async => http.Response('Not Found', 404));

    // act
    final call = dataSource.getTrendingMovies;

    // assert
    expect(() => call(), throwsA(isA<ServerException>()));
  });
}
