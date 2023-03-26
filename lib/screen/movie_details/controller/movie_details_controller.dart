import 'dart:developer';

import 'package:cinephile/screen/movie_details/model/movie_details_model.dart';
import 'package:cinephile/screen/movie_details/service/detail_service.dart';

import 'package:get/get.dart';

class MovieDetailsController extends GetxController{
 
 bool isLoding = true;
late DetailsMovie movieDetails;
  void getMovieDetails(String id)async{
    isLoding = true;
    await DetailsService().getMovieDetails(id).then((value) {
      log(value.toString());
      if (value != null) {
  
        movieDetails = value;
        update();
        isLoding = false;
        update();
      } else {
        isLoding = true;
        update();
        log('value empty');
      }
    });

  }

}