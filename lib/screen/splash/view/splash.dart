import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cinephile/core/const.dart';
import 'package:cinephile/screen/authentication/sigin/view/signin.dart';
import 'package:cinephile/screen/home/view/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MySplash extends StatelessWidget {
  const MySplash({super.key});

  @override
  Widget build(BuildContext context) {
    final auth=FirebaseAuth.instance.currentUser;
    log(auth.toString());
    Future.delayed(
      const Duration(seconds: 4),
      () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>auth==null? const SignIn():const HomePage(),
      )),
    );
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration:  BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: TheameValue().appColor,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedTextKit(
              animatedTexts: [
                FadeAnimatedText(
                  duration: const Duration(seconds: 3),
                  'Cinephile',
                  textStyle:
                       TextStyle(fontSize: 40.0, color: TheameValue().kwhite),
                ),
              ],
              totalRepeatCount: 1,
              pause: const Duration(milliseconds: 1000),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ),
          ],
        ),
      ),
    );
  }
}
