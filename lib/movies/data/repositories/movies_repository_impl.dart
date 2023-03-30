import 'package:dartz/dartz.dart';
import 'package:movies/core/error/exception.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/movies/domain/entites/movie.dart';
import 'package:movies/movies/domain/entites/movie_details.dart';
import 'package:movies/movies/domain/entites/recommendation.dart';
import 'package:movies/movies/domain/entites/trailer.dart';
import 'package:movies/movies/domain/repositories/movies_repository.dart';
import 'package:movies/movies/domain/usecases/get_movie_details.dart';
import 'package:movies/movies/domain/usecases/get_recommendation.dart';
import 'package:movies/movies/domain/usecases/get_trailer_usecase.dart';

import '../datasources/remote/movies_remote_data_source.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  MoviesRemoteDataSource moviesRemoteDataSource;

	MoviesRepositoryImpl(this.moviesRemoteDataSource);

  @override
  Future<Either<Failure,List<Movie>>> getNowPlaying() async {
    final result=await moviesRemoteDataSource.getNowPlayingMovies();
    try{
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorModel.statusMessage));
    }

  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result=await moviesRemoteDataSource.getPopularMovies();
    try{
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result=await moviesRemoteDataSource.getTopRatedMovies();
    try{
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(movieId) async {
    final result=await moviesRemoteDataSource.getMovieDetails(movieId);
    try{
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameters movieId) async {
    final result=await moviesRemoteDataSource.getRecommendation(movieId);
    try{
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Trailer>>> getTrailer(TrailerParameters movieId) async {
    final result=await moviesRemoteDataSource.getTrailer(movieId);
    try{
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorModel.statusMessage));
    }

  }


}
