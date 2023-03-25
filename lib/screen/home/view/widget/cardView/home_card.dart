
import 'package:cinephile/common/base_url.dart';
import 'package:flutter/material.dart';

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
              height: 27,
              width: 140,
              color: Colors.blueGrey[50],
              child: Center(
                child: Text(
                  text,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 140,
              width: 140,
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${imag}',
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
