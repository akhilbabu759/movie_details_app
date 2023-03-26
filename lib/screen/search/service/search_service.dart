import 'dart:convert';
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
      Response response =await dio.get(baseurl+endUrl+'&query=${query}');
       if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString(),name: 'search');
        // final movie=[response.data as Map]..map((e) =>List.filled(response.data, SearchModel.fromJson(e)) )  ;
        // final  carouselListe = (response.data as List  ).toList()
        //     .map(
        //       (e) => SearchModel.fromJson(e),
        //     )
        //     .toList();
       
// final movieListResponse = MovieListResponse.fromJson(response.data);
//       final movies = movieListResponse.results;
// final responseJson = response.data.toString(); // Replace with the JSON string you received
// final List<SearchModel> movieListResponse = SearchModel.fromJson(response );
      // final movies = (response.data[''] as List)
      //       .map((result) => SearchModel.fromJson(result))
      //       .toList();
            // log(searchResults[0].logoPath.toString(),name: 'opoo');


        //  final List<MoviesModel> movieList=FormData.fromMap(response.data) as List<MoviesModel>;
      //   List data = jsonDecode(response.data).cast<Map<String, dynamic>>();
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