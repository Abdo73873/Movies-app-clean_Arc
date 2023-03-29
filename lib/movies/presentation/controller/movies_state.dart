part of 'movies_bloc.dart';

@immutable
class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingErrorMessage;
  final List<Movie> popularMovies;
  final RequestState popularState;
  final String popularErrorMessage;
  final List<Movie> topRatedMovies;
  final RequestState topRatedState;
  final String topRatedErrorMessage;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingErrorMessage = '',
    this.popularMovies = const [],
    this.popularState = RequestState.loading,
    this.popularErrorMessage = '',
    this.topRatedMovies = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedErrorMessage = '',
  });
MoviesState copyWith({
  List<Movie>? nowPlayingMovies,
  RequestState? nowPlayingState,
  String? nowPlayingErrorMessage,
  List<Movie>? popularMovies,
  RequestState? popularState,
  String? popularErrorMessage,
  List<Movie>? topRatedMovies,
  RequestState? topRatedState,
  String? topRatedErrorMessage,
})=>MoviesState(
  nowPlayingMovies: nowPlayingMovies??this.nowPlayingMovies,
  nowPlayingState: nowPlayingState??this.nowPlayingState,
  nowPlayingErrorMessage: nowPlayingErrorMessage??this.nowPlayingErrorMessage,
  popularMovies: popularMovies??this.popularMovies,
  popularState: popularState??this.popularState,
  popularErrorMessage: popularErrorMessage??this.popularErrorMessage,
  topRatedMovies: topRatedMovies??this.topRatedMovies,
  topRatedState: topRatedState??this.topRatedState,
  topRatedErrorMessage: topRatedErrorMessage??this.topRatedErrorMessage,
);
  @override
  List<Object> get props =>
      [
        nowPlayingMovies,
        nowPlayingState,
        nowPlayingErrorMessage,
        popularMovies,
        popularState,
        popularErrorMessage,
        topRatedMovies,
        topRatedState,
        topRatedErrorMessage,
      ];
}

class MoviesInitial extends MoviesState {}
