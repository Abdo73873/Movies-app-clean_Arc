import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/movies/data/datasources/remote/movies_remote_data_source.dart';
import 'package:movies/movies/data/datasources/remote/movies_remote_data_source_impl.dart';
import 'package:movies/movies/data/repositories/movies_repository_impl.dart';
import 'package:movies/movies/domain/repositories/movies_repository.dart';
import 'package:movies/movies/domain/usecases/get_nowplaying_movies.dart';

import '../../domain/entites/movie.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  List<Movie> movies=[];
  @override
  void initState() {
    _getData();
    super.initState();
  }
  Future<void> _getData() async {
    MoviesRemoteDataSource moviesRemoteDataSource=MoviesRemoteDataSourceImpl();
    MoviesRepository moviesRepository=MoviesRepositoryImpl(moviesRemoteDataSource);
    final result=await GetNowPlayingMoviesUseCase(moviesRepository).execute();
    result.fold((l) => null, (list){
      movies=list;
      print(movies[0].title);
    });

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold();
  }
}
