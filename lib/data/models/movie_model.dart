import '../../domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel({
    required String id,
    required String title,
    required String overview,
    required String posterPath,
  }) : super(
          id: id,
          title: title,
          overview: overview,
          posterPath: posterPath,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'poster_path': posterPath,
    };
  }

  Movie toEntity() {
    return Movie(
      id: id,
      title: title,
      overview: overview,
      posterPath: posterPath,
    );
  }
}
