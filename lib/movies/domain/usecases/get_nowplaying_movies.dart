
import 'package:movies/movies/domain/entites/movie.dart';
import 'package:movies/movies/domain/repositories/movies_repository.dart';

class GetNowPlayingMoviesUseCase {
  final MoviesRepository moviesRepository;

  GetNowPlayingMoviesUseCase(this.moviesRepository);
  Future<List<Movie>> execute() async {
    return await moviesRepository.getNowPlaying();
  }
}