import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/core/usecase/base_usecase.dart';
import 'package:movies/movies/domain/entites/movie_details.dart';
import 'package:movies/movies/domain/repositories/movies_repository.dart';


class GetMovieDetailsUseCase extends BaseUseCase<MovieDetails, MovieDetailsParameters> {
  MoviesRepository moviesRepository ;

  GetMovieDetailsUseCase(this.moviesRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(MovieDetailsParameters parameters) async {
    return await moviesRepository.getMovieDetails(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int id;

  const MovieDetailsParameters({required this.id});

  @override
  List<Object> get props => [id];
}