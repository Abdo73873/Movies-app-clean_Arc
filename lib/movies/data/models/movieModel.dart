import 'package:movies/movies/domain/entites/movie.dart';

class MovieModel extends Movie {

  const MovieModel({required super.id,
    required super.backdropPath,
    required super.genreIds,
    required super.overview,
    required super.title,
    required super.voteAverage,
    required super.releaseDate,
    required super.posterPath});

  factory MovieModel.fromJson(Map<String, dynamic> json)=>
      MovieModel(
        id: json['id'],
        backdropPath: json['backdrop_path']??json['poster_path'],
        genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
        overview: json['overview'],
        title: json['title'],
        voteAverage: json['vote_average'].toDouble(),
        releaseDate: json['release_date']??'',
        posterPath: json['poster_path'],
      );
}
