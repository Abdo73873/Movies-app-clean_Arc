import 'package:get_it/get_it.dart';
import 'package:movies/movies/data/datasources/remote/movies_remote_data_source.dart';
import 'package:movies/movies/data/datasources/remote/movies_remote_data_source_impl.dart';
import 'package:movies/movies/domain/repositories/movies_repository.dart';
import 'package:movies/movies/domain/usecases/get_movie_details.dart';
import 'package:movies/movies/domain/usecases/get_nowplaying_movies.dart';
import 'package:movies/movies/domain/usecases/get_popular_movies.dart';
import 'package:movies/movies/domain/usecases/get_recommendation.dart';
import 'package:movies/movies/domain/usecases/get_top_reated_movies.dart';
import 'package:movies/movies/domain/usecases/get_trailer_usecase.dart';
import 'package:movies/movies/presentation/controller/movie_details_bloc.dart';
import 'package:movies/movies/presentation/controller/movies_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../movies/data/repositories/movies_repository_impl.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ///Bloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(), sl(),sl()));

    ///UseCases
    sl.registerLazySingleton<GetNowPlayingMoviesUseCase>(
        () => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton<GetPopularMoviesUseCase>(
        () => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton<GetTopRatedMoviesUseCase>(
        () => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton<GetMovieDetailsUseCase>(
        () => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton<GetRecommendationUseCase>(
        () => GetRecommendationUseCase(sl()));
    sl.registerLazySingleton<GetTrailerUseCase>(
        () => GetTrailerUseCase(sl()));

    ///Repository
    sl.registerLazySingleton<MoviesRepository>(
        () => MoviesRepositoryImpl(sl()));

    ///Data Source
    sl.registerLazySingleton<MoviesRemoteDataSource>(
        () => MoviesRemoteDataSourceImpl());

    ///Variables
    sl.registerLazySingleton<YoutubePlayerController>(
        () => YoutubePlayerController(initialVideoId: '43_Nh6ymnRQ',flags:const YoutubePlayerFlags(
          mute: false,
          autoPlay: true,
        ) ));
  }
}
