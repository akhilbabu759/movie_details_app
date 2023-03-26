import 'dart:developer';

import 'package:cinephile/common/base_url.dart';
import 'package:cinephile/common/end_url.dart';
import 'package:cinephile/screen/home/model/home_model.dart';
import 'package:dio/dio.dart';

class HomeService {
  final dio = Dio(BaseOptions());
  final baseurl = BaseUrl().baseurl;
  final endUrl = EndUrl().getMovie;
  Future<List<MoviesModel>?> getMovie() async {
    log(baseurl + endUrl);
    try {
      Response response = await dio.get(baseurl + endUrl);
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());



        final movieListResponse = MovieListResponse.fromJson(response.data);
        final movies = movieListResponse.results;

        return movies;
      } else {
        return null;
      }
    } on DioError catch (e) {
      log(e.message.toString());
    }
    return null;
  }
}
