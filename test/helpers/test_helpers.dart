import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:movies/domain/repositories/movie_repository.dart';

@GenerateMocks([MovieRepository, MockSpec<http.Client>])
void main() {}
