
import 'package:dartz/dartz.dart';
import 'package:movies/movies/domain/entites/movie.dart';
import 'package:movies/movies/domain/repositories/movies_repository.dart';

import '../../../core/error/failure.dart';

class GetNowPlayingMoviesUseCase {
  final MoviesRepository moviesRepository;

  GetNowPlayingMoviesUseCase(this.moviesRepository);
  Future<Either<Failure,List<Movie>>> execute() async {
    return await moviesRepository.getNowPlaying();
  }
}