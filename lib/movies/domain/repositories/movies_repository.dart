import 'package:dartz/dartz.dart';
import 'package:movies/movies/data/datasources/remote/movies_remote_data_source.dart';
import 'package:movies/movies/domain/entites/movie.dart';

import '../../../core/error/failure.dart';

abstract class MoviesRepository {

  Future<Either<Failure,List<Movie>>> getNowPlaying();

  Future<Either<Failure,List<Movie>>> getPopularMovies();

  Future<Either<Failure,List<Movie>>> getTopRatedMovies();
}
