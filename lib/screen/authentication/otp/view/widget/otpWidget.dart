import 'dart:developer';


import 'package:cinephile/core/const.dart';
import 'package:cinephile/screen/authentication/sigin/view/signin.dart';
import 'package:cinephile/screen/home/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';



class OtpWidget extends StatelessWidget {
  const OtpWidget({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;
  static String verify='';

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
     String smsCode='';
    return Padding(
      padding: EdgeInsets.only(
        top: height * 0.15,
      ),
      child: SingleChildScrollView(
        child: Container(
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  'OTP Authentication',
                  style: GoogleFonts.actor(
                      textStyle: const TextStyle(fontSize: 30),
                      fontWeight: FontWeight.w100,
                      color: TheameValue().kwhite),
                ),
              ),
              const SizedBox(
                height: 05,
              ),
               Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  'An authentication code has been sent to your\nphone number : phone',
                  style: TextStyle(color: TheameValue().kwhite, fontSize: 16),
                ),
              ),
               Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Please enter your OTP below!',
                    style: TextStyle(color: TheameValue().kwhite, fontSize: 16)),
              ),
              const SizedBox(
                height: 20,
              ),
              OtpTextField(
                  focusedBorderColor: TheameValue().kwhite,
                  fieldWidth: width * 0.165,
                  textStyle:  TextStyle(color: TheameValue().kwhite),
                  numberOfFields: 4,
                  borderColor: TheameValue().kwhite,
                  enabledBorderColor: TheameValue().kwhite,
                  borderRadius: BorderRadius.circular(10),
                  showFieldAsBox: true,
                  onSubmit: (String verificationCode) {
                    smsCode=verificationCode;

                  }),
              SizedBox(
                height: height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () async{
                    try{
                       PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: OtpWidget. verify, smsCode: smsCode);

    // Sign the user in (or link) with the credential
    await auth.signInWithCredential(credential);
    Get.off(const HomePage());

                    }catch(e){
                      log('wrong otp');

                    }
                    
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: height * 0.06,
                    width: width * 0.9,
                    child:  Center(
                      child: Text(
                        'CONTINUE',
                        style: TextStyle(color: TheameValue().kwhite, fontSize: 13),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => const SignIn());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: height * 0.06,
                    width: width * 0.9,
                    child:  Center(
                      child: Text(
                        "Didn't get Otp?",
                        style: TextStyle(color: TheameValue().kwhite, fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
