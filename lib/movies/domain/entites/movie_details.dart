import 'package:equatable/equatable.dart';

class MovieDetails extends Equatable {
  final String backdropPath;
  final int id;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final int runtime;
  final String title;
  final double voteAverage;
  final int voteCount;
  final List<Genres> genres;

  const MovieDetails({
    required this.backdropPath,
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.runtime,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
    required this.genres,
  });

  @override
  List<Object> get props =>
      [
        backdropPath,
        id,
        overview,
        posterPath,
        releaseDate,
        runtime,
        title,
        voteAverage,
        voteCount,
        genres,
      ];

}

class Genres extends Equatable {
  final String name;
  final int id;

  const Genres({required this.name,required this.id});

  @override
  List<Object> get props => [name, id];
}