import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thermonic/pages/splash/splash_controller.dart';

import '../../core/common/constants/image_constants.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      primary: true,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
             /* gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  ColorConstants.primaryColor,
                  ColorConstants.whiteColor,
                ],
              ),*/
            ),
            child: Center(
              child: /*SvgPicture.asset(
                ImageConstants.icAppLogo,
                height: 132,
                width: 124,
              ),*/
                Image.asset(
                  ImageConstants.icAppLogo,
                  height: 132,
                  width: 124,
                )
            ),
          ),
        /*  Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: SvgPicture.asset(
              height: 150,
              ImageConstants.icSplashLowerBg,
              fit: BoxFit.fitWidth,
              width: double.infinity,
              // width: double.infinity,
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            top: 0,
            child: SvgPicture.asset(
              height: 150,
              ImageConstants.icSplashUpperBg,
              fit: BoxFit.fitWidth,
              width: double.infinity,
              // width: double.infinity,
            ),
          ),*/
        ],
      ),
    );
  }
}
