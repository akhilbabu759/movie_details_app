import 'dart:developer';


import 'package:cinephile/screen/search/model/search_model.dart';
import 'package:cinephile/screen/search/service/search_service.dart';
import 'package:get/get.dart';

class SearchController extends GetxController{
  @override
  void onInit() {
    getMovieList('a');
    super.onInit();
  }
  late List <SearchModel?> movieList;
   bool isLoding = true;
  void getMovieList(String qury) async {
    log('message');
    isLoding = true;
    update();
    await SearchService().searchService(qury).then((value) {
      log(value.toString(),name: 'contr');
      if (value != null) {
  
        movieList = value;
        update();
        isLoding = false;
        update();
      } else {
        isLoding = true;
        update();
        log('value empty');
      }
    });
    isLoding = false;
    update();
  }
}