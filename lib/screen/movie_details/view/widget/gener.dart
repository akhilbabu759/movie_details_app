import 'package:cinephile/screen/movie_details/controller/movie_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Genere extends StatelessWidget {
  const Genere({
    Key? key,
    required this.DetailControl,
  }) : super(key: key);

  final MovieDetailsController DetailControl;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: SizedBox(width: Get.width,height: 40,
        child: ListView.builder(shrinkWrap: true,
          scrollDirection: Axis.horizontal ,
          itemCount:DetailControl.movieDetails.genres.length ,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Container(decoration: BoxDecoration(color: Color.fromARGB(255, 25, 81, 105),borderRadius: BorderRadius.circular(20)),
              
              width: 130,height:10,
              child: Center(child: Text(DetailControl.movieDetails.genres[index].name,style: TextStyle(color: Colors.white),))),
          ),),
      ),
    );
  }
}