class ApiConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apikey = '8b0677be57e33995ce607e16986d2982';
  static const String nowPlayingMoviesPath = '$baseUrl/movie/now_playing?api_key=$apikey';
  static const String popularMoviesPath = '$baseUrl/movie/popular?api_key=$apikey';
  static const String topRatedMoviesPath = '$baseUrl/movie/top_rated?api_key=$apikey';
}
