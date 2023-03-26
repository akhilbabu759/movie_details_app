
import 'package:cinephile/common/base_url.dart';
import 'package:cinephile/core/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({Key? key, required this.imag, required this.text})
      : super(key: key);
  final String text;
  final String imag;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
          )
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Card(
        borderOnForeground: true,
        elevation: 3,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Color.fromARGB(255, 32, 103, 133),boxShadow: [BoxShadow(blurRadius: 5,color: TheameValue().kwhite),BoxShadow(blurRadius: 5,color: TheameValue().kblack)],),
              height: Get.height*0.05,
              width: 140,
              
              child: Center(
                child: Text(overflow: TextOverflow.ellipsis,
                  text,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: Get.height*0.28,
              width: 140,
              child:imag=='null' ? Text('image not available',style: TextStyle(color: Colors.red),)
         : Image.network(
                'https://image.tmdb.org/t/p/w500$imag',
                // '${BaseUrl().baseurl}3$imag'
                
                fit: BoxFit.scaleDown,
              ),
            )
          ],
        ),
      ),
    );
  }
}
