import 'package:cinephile/common/api_key.dart';

class EndUrl{
  final String getMovie='3/movie/popular?api_key=${ApiKey().apiKey}&language=en-US&page=1';
  final String movieDetails='3/movie/{movie_id}?api_key=${ApiKey().apiKey}&language=en-US';
}