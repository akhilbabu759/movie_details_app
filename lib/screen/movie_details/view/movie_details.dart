import 'dart:ui';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cinephile/screen/movie_details/controller/movie_details_controller.dart';
import 'package:cinephile/screen/movie_details/model/movie_details_model.dart';
import 'package:cinephile/screen/movie_details/view/widget/gener.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    final DetailControl = Get.put(MovieDetailsController());
    DetailControl.GetMovieDetails(id);
    return GetBuilder<MovieDetailsController>(builder: (controller) {
      return
          // DetailControl.isLoding == true
          //     ? const Center(
          //         child: CircularProgressIndicator(
          //           color: Colors.white,
          //           backgroundColor: Colors.cyan,
          //         ),
          //       )
          //     :
          Scaffold(
              appBar: AppBar(
                leading: IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(Icons.arrow_back_ios)),
                centerTitle: true,
                title: const Text('Cinephile'),
                // actions: [
                //   IconButton(
                //       onPressed: () {
                //         Get.to(const SearchPage());
                //       },
                //       icon: const Icon(Icons.search))
                // ],
                backgroundColor: const Color.fromARGB(255, 25, 81, 105),
              ),
              body: Column(children: [
                Container(
                  child: Image.network(
                      'https://image.tmdb.org/t/p/w500/2Eewgp7o5AU1xCataDmiIL2nYxd.jpg'
                      // ${DetailControl.movieDetails.backdropPath}
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    DetailControl.movieDetails.title,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                 Padding(
                   padding: const EdgeInsets.only(right:28.0,bottom: 10),
                   child: Row(mainAxisAlignment: MainAxisAlignment.end,
                     children: [RatingBar.builder(
                          initialRating: double.parse(DetailControl.movieDetails.voteAverage.toString()),
                          itemSize: 20,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          ignoreGestures: true,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (startRating) {
                            // log(startRating.toString());
                          },
                        ), SizedBox(width: 3,),Text(DetailControl.movieDetails.voteCount.toString())
                        ]
                   ),
                 ),
                Genere(DetailControl: DetailControl),
                Container(
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Expanded(
                          //   child: SizedBox(width: Get.width,
                          //     child: ListView.builder(shrinkWrap: true,
                          //       scrollDirection: Axis.vertical ,
                          //       itemCount:6 ,
                          //       itemBuilder: (context, index) => Container(color: Colors.amberAccent,
                          //         width: Get.width*0.1,height: Get.height*0.1,),),
                          //   ),
                          // ),
                          Text(
                            'Description:',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            DetailControl.movieDetails.overview,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Release Date : ' +
                                DetailControl.movieDetails.releaseDate.day
                                    .toString() +
                                '/' +
                                DetailControl.movieDetails.releaseDate.month
                                    .toString() +
                                '/' +
                                DetailControl.movieDetails.releaseDate.year
                                    .toString(),
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 5,),

                          Text(
                              'Film Dureation: ' +
                                  DetailControl.movieDetails.runtime
                                      .toString() +
                                  ' miniute',
                              style: TextStyle(fontSize: 16))
                        ]),
                  ),
                ),
              ]));
    });
  }
}
