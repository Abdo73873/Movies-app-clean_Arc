import 'package:equatable/equatable.dart';

class Trailer extends Equatable {
  final String videoId;
  final String site;

  const Trailer({required this.videoId, required this.site});

  @override
  List<Object> get props => [videoId, site];
}