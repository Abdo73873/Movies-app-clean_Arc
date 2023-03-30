
import 'package:dartz/dartz.dart';
import 'package:movies/core/usecase/base_usecase.dart';
import 'package:movies/movies/domain/entites/movie.dart';
import 'package:movies/movies/domain/repositories/movies_repository.dart';

import '../../../core/error/failure.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<List<Movie>,NoParameters>{
  final MoviesRepository moviesRepository;

  GetTopRatedMoviesUseCase(this.moviesRepository);
  @override
  Future<Either<Failure,List<Movie>>> call(parameters) async {
    return await moviesRepository.getTopRatedMovies();
  }
}
