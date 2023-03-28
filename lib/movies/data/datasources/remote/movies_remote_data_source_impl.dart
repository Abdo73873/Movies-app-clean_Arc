import 'package:dio/dio.dart';
import 'package:movies/core/network/api_constant.dart';
import 'package:movies/core/network/error_model.dart';
import 'package:movies/movies/data/datasources/remote/movies_remote_data_source.dart';
import 'package:movies/movies/data/models/movieModel.dart';

class MoviesRemoteDataSourceImpl extends MoviesRemoteDataSource {

  MoviesRemoteDataSourceImpl();

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {

    final response = await Dio().get(ApiConstants.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List).map((e) =>
          MovieModel.fromJson(e)));
    }
    else {
      return throw ErrorModel.fromJson(response.data);
    }

  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstants.popularMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List).map((e) =>
          MovieModel.fromJson(e)));
    }
    else {
      return throw ErrorModel.fromJson(response.data);
    }


  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstants.topRatedMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List).map((e) =>
          MovieModel.fromJson(e)));
    }
    else {
      return throw ErrorModel.fromJson(response.data);
    }

  }

}
