import 'dart:developer';

import 'package:cinephile/screen/home/view/widget/cardView/home_card.dart';
import 'package:cinephile/screen/search/controller/search_controller.dart';
import 'package:cinephile/screen/search/model/search_model.dart';
import 'package:cinephile/screen/search/view/one_product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final searchC=Get.put(SearchController());
    final TextEditingController textC=TextEditingController();
    return Scaffold(
      body: GetBuilder<SearchController>(builder: (controller) {
        // log(searchC.movieList.length.toString());
        // log(searchC.movieList[0].results.length.toString());
        return   Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 21, 21, 27),
                Color.fromARGB(255, 32, 103, 133),
              ],
            ),
          ),
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [SizedBox(height: 20,),
              TextFormField(controller:textC ,onChanged: (value) =>searchC.getMovieList(value) ,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white38),
                      borderRadius: BorderRadius.circular(20)),
                  disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                  labelText: 'Search movies',
                  labelStyle: const TextStyle(color: Colors.white),
                ),
              ),
              Expanded(
              child:searchC.isLoding == true
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                  backgroundColor: Colors.cyan,
                ),
              )
              :
                       GridView.builder(
                    itemCount: searchC.movieList[0]!.results.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        childAspectRatio: 1 / 1.5),
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(left:2.0,top: 1),
                      child:  HomeCard(imag:searchC.movieList[0]!.results[index].posterPath.toString() ,text: searchC.movieList[0]!.results[index].title,)
                    ),
                  ))
            // : ListView.builder(shrinkWrap: true,
            //     itemCount: searchC.movieList[0]!.results.length,
            //     itemBuilder: (context, index) {
            //       log(searchC.movieList[0]!.results[index].backdropPath.toString(),name: 'undo');
            //       // final model=SearchModel(id: searchC.movieList[index].id, name: searchC.movieList[index].name, originCountry: searchC.movieList[index].originCountry,logoPath: searchC.movieList[index].logoPath);
              
            //        return HomeCard(imag:searchC.movieList[0]!.results[index].backdropPath.toString() ,text: searchC.movieList[0]!.results[index].title,);
                  
            //     } ,))
              
            ],
          ),
        );
      },
      ),
    );
  }
}
