import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screen/movie_details/view/movie_details.dart';
import 'screen/splash/view/splash.dart';


void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MovieDetails(id:'1011679' ),
    );
  }
}
