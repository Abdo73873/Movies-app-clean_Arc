
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movies/core/usecase/base_usecase.dart';
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
    on<GetNowPlayingMoviesEvent>(_getPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getPlayingMovies(event, emit) async{
      final result = await getNowPlayingMoviesUseCase(const NoParameters());
      result.fold(
              (l) => emit(
              state.copyWith(nowPlayingErrorMessage: l.message,
                  nowPlayingState: RequestState.error)),
              (list) => emit(state.copyWith(
              nowPlayingMovies: list, nowPlayingState: RequestState.loaded)));
  }
  FutureOr<void> _getPopularMovies (event,emit)async {
    final result=await getPopularMoviesUseCase(const NoParameters());
    result.fold(
          (l) => emit(state.copyWith(popularErrorMessage: l.message,popularState: RequestState.error)),
          (r) => emit(state.copyWith(popularMovies: r,popularState: RequestState.loaded)),
    );
  }
  FutureOr<void> _getTopRatedMovies(event,emit)async {
    final result=await getTopRatedMoviesUseCase(const NoParameters());
    result.fold(
          (l) => emit(state.copyWith(topRatedErrorMessage: l.message,topRatedState: RequestState.error)),
          (r) => emit(state.copyWith(topRatedMovies: r,topRatedState: RequestState.loaded)),
    );
  }
}
