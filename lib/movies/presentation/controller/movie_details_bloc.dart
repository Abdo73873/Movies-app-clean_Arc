import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/enums.dart';
import 'package:movies/movies/domain/entites/movie_details.dart';
import 'package:movies/movies/domain/entites/recommendation.dart';
import 'package:movies/movies/domain/entites/trailer.dart';
import 'package:movies/movies/domain/usecases/get_movie_details.dart';
import 'package:movies/movies/domain/usecases/get_recommendation.dart';
import 'package:movies/movies/domain/usecases/get_trailer_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {

  MovieDetailsBloc(this.getMovieDetailsUseCase,this.getRecommendationUseCase,this.getTrailerUseCase) : super(const MovieDetailsState()  ) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendation);
    on<GetTrailerEvent>(_getTrailer);
  }
final GetMovieDetailsUseCase getMovieDetailsUseCase;
final GetRecommendationUseCase getRecommendationUseCase;
final GetTrailerUseCase getTrailerUseCase;

  Future<FutureOr<void>> _getMovieDetails(GetMovieDetailsEvent event,emit) async {
    final result=await getMovieDetailsUseCase(MovieDetailsParameters(id: event.id));
    result.fold((l){
      emit(state.copyWith(errorMessageMovies: l.message,moviesState: RequestState.error));
    }, (r){
      emit(state.copyWith(movieDetails: r,moviesState: RequestState.loaded));

    });

  }

  Future<FutureOr<void>> _getRecommendation(GetMovieRecommendationEvent event, emit) async {
    final result=await getRecommendationUseCase(RecommendationParameters(id: event.id));
    result.fold((l){
      emit(state.copyWith(errorMessageRecommendation: l.message,recommendationState: RequestState.error));
    }, (r){
      emit(state.copyWith(recommendation: r,recommendationState: RequestState.loaded));

    });
  }

  Future<FutureOr<void>> _getTrailer(GetTrailerEvent event,  emit) async {
    final result= await getTrailerUseCase(TrailerParameters(movieId: event.movieId));
    result.fold((l){
      emit(state.copyWith(errorMessageTrailer: l.message,trailerState: RequestState.error));
    }, (r){
      emit(state.copyWith(trailer: r,trailerState: RequestState.loaded));

    });
  }

}
