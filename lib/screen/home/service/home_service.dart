import 'dart:developer';

import 'package:cinephile/common/base_url.dart';
import 'package:cinephile/common/end_url.dart';
import 'package:cinephile/screen/home/model/home_model.dart';
import 'package:dio/dio.dart';
class HomeService{
  final dio = Dio();
  final baseurl=BaseUrl().baseurl;
  final endUrl=EndUrl().getMovie;
  Future<List<MoviesModel>?> getMovie()async{
    try{
      Response response =await dio.get(baseurl+endUrl);
       if (response.statusCode == 200 || response.statusCode == 201) {
      final List<MoviesModel> movieList=(response.data as List).map((e) => MoviesModel.fromJson(e)).toList();
      return movieList;
       }else{
        return null;
       }
    }on DioError catch(e){
      log(e.message.toString());
    }
    return null;

  }


}