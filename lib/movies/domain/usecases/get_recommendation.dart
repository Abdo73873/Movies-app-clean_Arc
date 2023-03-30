import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/core/usecase/base_usecase.dart';
import 'package:movies/movies/domain/entites/recommendation.dart';
import 'package:movies/movies/domain/repositories/movies_repository.dart';
import 'package:movies/movies/domain/usecases/get_movie_details.dart';

class GetRecommendationUseCase extends BaseUseCase<List<Recommendation>,RecommendationParameters>{
  MoviesRepository moviesRepository;

  GetRecommendationUseCase(this.moviesRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(parameters) async {
    return await moviesRepository.getRecommendation(parameters);
  }

}
class RecommendationParameters extends Equatable {
  final int id;

  const RecommendationParameters({required this.id});

  @override
  List<Object> get props => [id];
}