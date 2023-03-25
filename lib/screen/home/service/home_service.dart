import 'dart:convert';
import 'dart:developer';

import 'package:cinephile/common/base_url.dart';
import 'package:cinephile/common/end_url.dart';
import 'package:cinephile/screen/home/model/home_model.dart';
import 'package:dio/dio.dart';
class HomeService{
  final dio = Dio(BaseOptions());
  final baseurl=BaseUrl().baseurl;
  final endUrl=EndUrl().getMovie;
  Future<List<MoviesModel>?> getMovie()async{
    log(baseurl+endUrl);
    try{
      Response response =await dio.get(baseurl+endUrl);
       if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
       

// final responseJson = response.data.toString(); // Replace with the JSON string you received

final movieListResponse = MovieListResponse.fromJson(response.data);
      final movies = movieListResponse.results;

        //  final List<MoviesModel> movieList=FormData.fromMap(response.data) as List<MoviesModel>;
      //   List data = jsonDecode(response.data).cast<Map<String, dynamic>>();
        // final List<MoviesModel> movieList=(response.data ).map((e) =>  MoviesModel.fromJson(e)).toList();
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