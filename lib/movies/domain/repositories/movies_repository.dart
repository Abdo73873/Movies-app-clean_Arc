import 'package:dartz/dartz.dart';
import 'package:movies/movies/domain/entites/movie.dart';
import 'package:movies/movies/domain/entites/movie_details.dart';
import 'package:movies/movies/domain/entites/recommendation.dart';
import 'package:movies/movies/domain/entites/trailer.dart';
import 'package:movies/movies/domain/usecases/get_recommendation.dart';
import 'package:movies/movies/domain/usecases/get_trailer_usecase.dart';

import '../../../core/error/failure.dart';
import '../usecases/get_movie_details.dart';

abstract class MoviesRepository {

  Future<Either<Failure,List<Movie>>> getNowPlaying();

  Future<Either<Failure,List<Movie>>> getPopularMovies();

  Future<Either<Failure,List<Movie>>> getTopRatedMovies();

  Future<Either<Failure,MovieDetails>> getMovieDetails(MovieDetailsParameters movieId);
  Future<Either<Failure,List<Recommendation>>> getRecommendation(RecommendationParameters movieId);

  Future<Either<Failure,List<Trailer>>> getTrailer(TrailerParameters movieId);
}
