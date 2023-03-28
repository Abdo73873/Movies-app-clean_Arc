import 'package:movies/movies/domain/entites/movie.dart';

class MovieModel extends Movie {

  const MovieModel({required super.id,
    required super.backdropPath,
    required super.genreIds,
    required super.overview,
    required super.title,
    required super.voteAverage,
    required super.releaseDate});

  factory MovieModel.fromJson(Map<String, dynamic> json)=>
      MovieModel(
          id: json['id'],
          backdropPath: json['id'],
          genreIds: json['id'],
          overview: json['id'],
          title:  json['id'],
          voteAverage:  json['id'],
          releaseDate:  json['id'],
      );
}
