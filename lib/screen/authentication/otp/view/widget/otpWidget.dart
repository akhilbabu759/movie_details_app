import 'package:cinephile/screen/authentication/signup/view/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';



class OtpWidget extends StatelessWidget {
  const OtpWidget({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
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
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 05,
              ),
              const Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  'An authentication code has been sent to your\nphone number : phone',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('Please enter your OTP below!',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
              const SizedBox(
                height: 20,
              ),
              OtpTextField(
                  focusedBorderColor: Colors.white,
                  fieldWidth: width * 0.165,
                  textStyle: const TextStyle(color: Colors.white),
                  numberOfFields: 4,
                  borderColor: Colors.white,
                  enabledBorderColor: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  showFieldAsBox: true,
                  onSubmit: (String verificationCode) {}),
              SizedBox(
                height: height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: height * 0.06,
                    width: width * 0.9,
                    child: const Center(
                      child: Text(
                        'CONTINUE',
                        style: TextStyle(color: Colors.white, fontSize: 13),
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
                    Get.to(() => const SignUp());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: height * 0.06,
                    width: width * 0.9,
                    child: const Center(
                      child: Text(
                        "Didn't get Otp?",
                        style: TextStyle(color: Colors.white, fontSize: 14),
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
