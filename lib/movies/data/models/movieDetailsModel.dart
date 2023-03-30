import 'package:movies/movies/domain/entites/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {required super.backdropPath,
      required super.id,
      required super.overview,
      required super.posterPath,
      required super.releaseDate,
      required super.runtime,
      required super.title,
      required super.voteAverage,
      required super.voteCount,
      required super.genres});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        backdropPath: json['backdrop_path'] ?? json['poster_path'],
        id: json['id'],
        overview: json['overview'],
        posterPath: json['poster_path'],
        releaseDate: json['release_date'],
        runtime: json['runtime'],
        title: json['title'],
        voteAverage: json['vote_average'].toDouble(),
        voteCount: json['vote_count'],
        genres: List<GenresModel>.from(json['genres'].map((e)=>GenresModel.fromJson(e))),
      );
}

class GenresModel extends Genres {
  const GenresModel({required super.name, required super.id});

  factory GenresModel.fromJson(Map<String, dynamic> json) => GenresModel(
    id: json['id'],
    name: json['name'],
  );
}
