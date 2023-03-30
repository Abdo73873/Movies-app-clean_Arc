import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/core/usecase/base_usecase.dart';
import 'package:movies/movies/domain/entites/trailer.dart';
import 'package:movies/movies/domain/repositories/movies_repository.dart';

class GetTrailerUseCase extends BaseUseCase<List<Trailer>,TrailerParameters>{
  MoviesRepository moviesRepository;

  GetTrailerUseCase(this.moviesRepository);

  @override
  Future<Either<Failure, List<Trailer>>> call(TrailerParameters parameters) async {
    return await moviesRepository.getTrailer(parameters);
  }
}

class TrailerParameters extends Equatable {
  final int movieId;

  const TrailerParameters({required this.movieId});

  @override
  List<Object> get props => [movieId];
}