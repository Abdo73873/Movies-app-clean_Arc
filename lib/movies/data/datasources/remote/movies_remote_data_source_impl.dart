import 'package:dio/dio.dart';
import 'package:movies/core/network/api_constant.dart';
import 'package:movies/core/network/error_model.dart';
import 'package:movies/movies/data/datasources/remote/movies_remote_data_source.dart';
import 'package:movies/movies/data/models/movieDetailsModel.dart';
import 'package:movies/movies/data/models/movieModel.dart';
import 'package:movies/movies/data/models/recommendation_model.dart';
import 'package:movies/movies/data/models/trailer_model.dart';
import 'package:movies/movies/domain/usecases/get_movie_details.dart';

import '../../../domain/usecases/get_recommendation.dart';
import '../../../domain/usecases/get_trailer_usecase.dart';

class MoviesRemoteDataSourceImpl extends MoviesRemoteDataSource {
  MoviesRemoteDataSourceImpl();

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstants.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      return throw ErrorModel.fromJson(response.data);
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstants.popularMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      return throw ErrorModel.fromJson(response.data);
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstants.topRatedMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      return throw ErrorModel.fromJson(response.data);
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final response =
        await Dio().get(ApiConstants.movieDetailsUrl(parameters.id));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      return throw ErrorModel.fromJson(response.data);
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(
      RecommendationParameters parameters) async {
    final response =
        await Dio().get(ApiConstants.recommendationUrl(parameters.id));
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from((response.data['results'] as List)
          .map((e) => RecommendationModel.fromJsom(e)));
    } else {
      return throw ErrorModel.fromJson(response.data);
    }
  }

  @override
  Future<List<TrailerModel>> getTrailer(TrailerParameters parameters) async {
    final response =
        await Dio().get(ApiConstants.trailerUrl(parameters.movieId));
    if (response.statusCode == 200) {
      return List<TrailerModel>.from((response.data['results'] as List)
          .map((e) => TrailerModel.fromJson(e)));
    } else {
      return throw ErrorModel.fromJson(response.data);
    }
  }
}
