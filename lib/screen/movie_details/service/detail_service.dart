import 'dart:developer';

import 'package:cinephile/common/api_key.dart';
import 'package:cinephile/common/base_url.dart';
import 'package:cinephile/common/end_url.dart';
import 'package:cinephile/screen/movie_details/model/movie_details_model.dart';
import 'package:dio/dio.dart';

class DetailsService{

  final dio = Dio(BaseOptions());
  final baseurl=BaseUrl().baseurl;
  final endUrl=EndUrl().movieDetails;
   Future<DetailsMovie?> getMovieDetails(String id)async{
    log(baseurl+endUrl);
    try{
      Response response =await dio.get('$baseurl$endUrl$id?api_key=${ApiKey().apiKey}&language=en-US');
       if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
       



final movieListResponse = DetailsMovie.fromJson(response.data);
      final movies = movieListResponse;


      return movies;
       }else{
        return null;
       }
    }on DioError catch(e){
      log(e.message.toString());
    }
    return null;

  }
}