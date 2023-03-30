part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestState moviesState;
  final String errorMessageMovies;
  final List<Recommendation> recommendation;
  final RequestState recommendationState;
  final String errorMessageRecommendation;
  final List<Trailer> trailer;
  final RequestState trailerState;
  final String errorMessageTrailer;

  const MovieDetailsState({
    this.movieDetails,
    this.moviesState = RequestState.loading,
    this.errorMessageMovies = '',
    this.recommendation = const [],
    this.recommendationState = RequestState.loading,
    this.errorMessageRecommendation = '',
    this.trailer = const [],
    this.trailerState = RequestState.loading,
    this.errorMessageTrailer = '',
  });

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? moviesState,
    String? errorMessageMovies,
    List<Recommendation>? recommendation,
    RequestState? recommendationState,
    String? errorMessageRecommendation,
     List<Trailer>? trailer,
     RequestState? trailerState,
     String? errorMessageTrailer,
  }) =>
      MovieDetailsState(
        movieDetails: movieDetails ?? this.movieDetails,
        moviesState: moviesState ?? this.moviesState,
        errorMessageMovies: errorMessageMovies ?? this.errorMessageMovies,
        recommendation: recommendation ?? this.recommendation,
        recommendationState: recommendationState ?? this.recommendationState,
        errorMessageRecommendation: errorMessageRecommendation ?? this.errorMessageRecommendation,
        trailer: trailer ?? this.trailer,
        trailerState: trailerState ?? this.trailerState,
        errorMessageTrailer: errorMessageTrailer ?? this.errorMessageTrailer,

      );

  @override
  List<Object?> get props =>
      [
        movieDetails,
        moviesState,
        errorMessageMovies,
        recommendation,
        recommendationState,
        errorMessageRecommendation,
        trailer,
        trailerState,
        errorMessageTrailer,
      ];
}
