import 'package:cinephile/screen/authentication/otp/view/widget/otpWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPscreen extends StatelessWidget {
  const OTPscreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = Get.size.width;
    double height = Get.size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 21, 21, 27),
                Color.fromARGB(255, 32, 103, 133),
              ],
            ),
          ),
          child: OtpWidget(
            height: height,
            width: width,
          ),
        ),
      ),
    );
  }
}
