
import 'package:movies/movies/domain/entites/movie.dart';
import 'package:movies/movies/domain/repositories/movies_repository.dart';

class GetPopularMoviesUseCase {
  final MoviesRepository moviesRepository;

  GetPopularMoviesUseCase(this.moviesRepository);
  Future<List<Movie>> execute() async {
    return await moviesRepository.getPopularMovies();
  }
}