import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String backdropPath;
  final List<int> genreIds;
  final String overview;
  final String title;
  final double voteAverage;
  final String releaseDate;
  final String posterPath;

  const Movie({
    required this.id,
    required this.backdropPath,
    required this.genreIds,
    required this.overview,
    required this.title,
    required this.voteAverage,
    required this.releaseDate,
    required this.posterPath,
  });

  @override
  List<Object> get props => [
        id,
        backdropPath,
        genreIds,
        overview,
        title,
        voteAverage,
      releaseDate,
    posterPath,
      ];
}
