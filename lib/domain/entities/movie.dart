import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final String id;
  final String title;
  final String overview;
  final String posterPath;

  Movie(
      {required this.id,
      required this.title,
      required this.overview,
      required this.posterPath});

  @override
  List<Object?> get props => [id, title, overview, posterPath];
}
