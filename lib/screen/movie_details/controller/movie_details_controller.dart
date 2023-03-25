import 'dart:developer';

import 'package:cinephile/screen/movie_details/model/movie_details_model.dart';
import 'package:cinephile/screen/movie_details/service/detail_service.dart';
import 'package:cinephile/screen/movie_details/view/movie_details.dart';
import 'package:get/get.dart';

class MovieDetailsController extends GetxController{
  @override
  void onInit() {
    // GetMovieDetails( id);
    super.onInit();
  }
 bool isLoding = true;
late DetailsMovie movieDetails;
  void GetMovieDetails(String id)async{
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