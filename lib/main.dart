import 'package:flutter/material.dart';
import 'package:movies/movies/domain/entites/movie.dart';
import 'package:movies/movies/presentation/screen/movie_screen.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MoviesScreen(),
    );
  }
}


