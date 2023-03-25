import 'package:cinephile/common/api_key.dart';

class EndUrl{
  final String getMovie='3/movie/popular?api_key=${ApiKey().apiKey}&language=en-US&page=1';
  final String movieDetails='3/movie/';
  final String search='3/search/company?api_key={API_KEY}&query={query}&page={page}';
}