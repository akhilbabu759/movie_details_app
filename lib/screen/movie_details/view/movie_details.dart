import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cinephile/screen/movie_details/controller/movie_details_controller.dart';

import 'package:cinephile/screen/movie_details/view/widget/gener.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    final detailControl = Get.put(MovieDetailsController());
    detailControl.getMovieDetails(id);
    return GetBuilder<MovieDetailsController>(builder: (controller) {
      return detailControl.isLoding == true
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
                backgroundColor: Colors.cyan,
              ),
            )
          : Scaffold(
              appBar: AppBar(
                leading: IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back_ios)),
                centerTitle: true,
                title: const Text('Cinephile'),
                backgroundColor: const Color.fromARGB(255, 25, 81, 105),
              ),
              body: Column(children: [
                Image.network(
                    'https://image.tmdb.org/t/p/w500/${detailControl.movieDetails.backdropPath}'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    detailControl.movieDetails.title,
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 28.0, bottom: 10),
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    RatingBar.builder(
                      initialRating: double.parse(
                          detailControl.movieDetails.voteAverage.toString()),
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
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(detailControl.movieDetails.voteCount.toString())
                  ]),
                ),
                Genere(detailControl: detailControl),
                SizedBox(
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Description:',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            detailControl.movieDetails.overview,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Release Date : ${detailControl.movieDetails.releaseDate.day}/${detailControl.movieDetails.releaseDate.month}/${detailControl.movieDetails.releaseDate.year}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                              'Film Dureation: ${detailControl.movieDetails.runtime} miniute',
                              style: const TextStyle(fontSize: 16))
                        ]),
                  ),
                ),
              ]));
    });
  }
}
