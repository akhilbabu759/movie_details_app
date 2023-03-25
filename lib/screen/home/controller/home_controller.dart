import 'dart:developer';

import 'package:cinephile/screen/home/model/home_model.dart';
import 'package:cinephile/screen/home/service/home_service.dart';
import 'package:get/get.dart';

class HomeControll extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    getMovieList();
    super.onInit();
  }
 bool isLoding = true;
  List<MoviesModel> movieList=[];
   void getMovieList() async {
    log('message');
    isLoding = true;
    update();
    await HomeService().getMovie().then((value) {
      log(value.toString());
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
