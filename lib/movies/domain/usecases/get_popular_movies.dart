
import 'package:dartz/dartz.dart';
import 'package:movies/movies/domain/entites/movie.dart';
import 'package:movies/movies/domain/repositories/movies_repository.dart';

import '../../../core/error/failure.dart';

class GetPopularMoviesUseCase {
  final MoviesRepository moviesRepository;

  GetPopularMoviesUseCase(this.moviesRepository);
  Future<Either<Failure,List<Movie>>> execute() async {
    return await moviesRepository.getPopularMovies();
  }
}