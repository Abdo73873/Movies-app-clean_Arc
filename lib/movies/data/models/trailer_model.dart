import 'package:movies/movies/domain/entites/trailer.dart';

class TrailerModel extends Trailer {
  const TrailerModel({required super.videoId, required super.site});

  factory TrailerModel.fromJson(Map<String, dynamic> json) =>
      TrailerModel(videoId: json['key'], site: json['site']);
}
