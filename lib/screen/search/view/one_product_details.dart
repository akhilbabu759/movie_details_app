// import 'dart:developer';


// import 'package:cinephile/screen/search/model/search_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// import 'package:get/get.dart';

// class OneProduct extends StatelessWidget {
//    OneProduct({Key? key, required this.model,required this.index}) : super(key: key);
//   final SearchModel model;
//   int index;

//   @override
//   Widget build(BuildContext context) {
//     // final cartcontrol = Get.put(CartController());
//     log(model.logoPath.toString(),name: 'last');
//     return ListTile(leading: model.logoPath==null?Padding(
//            padding: const EdgeInsets.only(top:28.0),
//            child: Text('image not available',style: TextStyle(color: Colors.red),),
//          ): Image.network('https://image.tmdb.org/t/p/w500${model.logoPath}',
//             // 'https://repository-images.githubusercontent.com/405182945/dff7288f-c493-45de-8089-8b16ff952d7b',
//             height: 150,
//             width: 150,
//           ),title: Text(model.name),);
    
//   }
// }
