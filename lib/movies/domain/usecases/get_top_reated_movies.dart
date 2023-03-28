
import 'package:movies/movies/domain/entites/movie.dart';
import 'package:movies/movies/domain/repositories/movies_repository.dart';

class GetTopRatedMoviesUseCase {
  final MoviesRepository moviesRepository;

  GetTopRatedMoviesUseCase(this.moviesRepository);
  Future<List<Movie>> execute() async {
    return await moviesRepository.getTopRatedMovies();
  }
}