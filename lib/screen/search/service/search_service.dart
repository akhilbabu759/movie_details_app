
import 'dart:developer';

import 'package:cinephile/common/base_url.dart';
import 'package:cinephile/common/end_url.dart';
import 'package:cinephile/screen/search/model/search_model.dart';
import 'package:dio/dio.dart';

class SearchService{
  final dio = Dio(BaseOptions());
  final baseurl=BaseUrl().baseurl;
  final endUrl=EndUrl().search;
  
  Future<List<SearchModel?>?> searchService(String query)async{
    
    log(baseurl+endUrl,name: 'api');
    try{
      Response response =await dio.get('$baseurl$endUrl&query=$query');
       if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString(),name: 'search');
        
    List<dynamic> dataList=[];
  if (response.data is List<dynamic>) {
    dataList = response.data as List<dynamic>;
  } else if (response.data is Map<String, dynamic>) {
    dataList = [response.data];
  }
  final List<SearchModel> movieList = dataList.map((e) => SearchModel.fromJson(e)).toList();
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