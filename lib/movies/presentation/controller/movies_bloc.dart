import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movies/core/utils/enums.dart';
import 'package:movies/movies/domain/usecases/get_nowplaying_movies.dart';

import '../../data/datasources/remote/movies_remote_data_source.dart';
import '../../data/datasources/remote/movies_remote_data_source_impl.dart';
import '../../data/repositories/movies_repository_impl.dart';
import '../../domain/entites/movie.dart';
import '../../domain/repositories/movies_repository.dart';

part 'movies_event.dart';

part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  MoviesBloc(this.getNowPlayingMoviesUseCase) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase.execute();
      result.fold(
          (l) => emit(MoviesState(
              nowPlayingErrorMessage: l.message,
              nowPlayingState: RequestState.error)),
          (list) => emit(MoviesState(
              nowPlayingMovies: list, nowPlayingState: RequestState.loaded)));
    });
  }
}
