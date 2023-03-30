import 'package:movies/movies/data/models/movieDetailsModel.dart';
import 'package:movies/movies/data/models/recommendation_model.dart';
import 'package:movies/movies/data/models/trailer_model.dart';
import 'package:movies/movies/domain/usecases/get_trailer_usecase.dart';

import '../../../domain/usecases/get_movie_details.dart';
import '../../../domain/usecases/get_recommendation.dart';
import '../../models/movieModel.dart';

abstract class MoviesRemoteDataSource {
Future<List<MovieModel>> getNowPlayingMovies();
Future<List<MovieModel>> getPopularMovies();
Future<List<MovieModel>> getTopRatedMovies();
Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);
Future<List<RecommendationModel>> getRecommendation(RecommendationParameters parameters);
Future<List<TrailerModel>> getTrailer(TrailerParameters parameters);
}
