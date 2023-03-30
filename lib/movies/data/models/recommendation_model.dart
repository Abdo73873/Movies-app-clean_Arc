import 'package:movies/movies/domain/entites/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel(
      {required super.backdropPath,
        required super.id});

  factory RecommendationModel.fromJsom(Map<String, dynamic> json) =>
      RecommendationModel(
        backdropPath: json['backdrop_path']??json['poster_path']??'',
        id: json['id'],
      );
}
