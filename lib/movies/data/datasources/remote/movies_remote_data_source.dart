import '../../models/movieModel.dart';

abstract class MoviesRemoteDataSource {
Future<List<MovieModel>> getNowPlayingMovies();
Future<List<MovieModel>> getPopularMovies();
Future<List<MovieModel>> getTopRatedMovies();
}
