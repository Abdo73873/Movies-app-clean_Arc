
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movies/core/utils/enums.dart';
import 'package:movies/movies/domain/usecases/get_nowplaying_movies.dart';
import 'package:movies/movies/domain/usecases/get_popular_movies.dart';
import 'package:movies/movies/domain/usecases/get_top_reated_movies.dart';
import '../../domain/entites/movie.dart';

part 'movies_event.dart';

part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase.execute();
      result.fold(
          (l) => emit(
            state
              MoviesState(
              nowPlayingErrorMessage: l.message,
              nowPlayingState: RequestState.error)),
          (list) => emit(MoviesState(
              nowPlayingMovies: list, nowPlayingState: RequestState.loaded)));
    });
    on<GetPopularMoviesEvent>((event,emit)async {
      final result=await getPopularMoviesUseCase.execute();
      result.fold(
              (l) => emit(MoviesState(popularErrorMessage: l.message,popularState: RequestState.error)),
              (r) => emit(MoviesState(popularMovies: r,popularState: RequestState.loaded)),
      );
    });
    on<GetTopRatedMoviesEvent>((event,emit)async {
      final result=await getTopRatedMoviesUseCase.execute();
      result.fold(
              (l) => emit(MoviesState(topRatedErrorMessage: l.message,topRatedState: RequestState.error)),
              (r) => emit(MoviesState(topRatedMovies: r,topRatedState: RequestState.loaded)),
      );
    });

  }
}
