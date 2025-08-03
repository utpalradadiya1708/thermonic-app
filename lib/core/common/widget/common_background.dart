import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonBackground extends GetView {
  const CommonBackground({
    required this.child,
    super.key,
    this.bottomNavigationBar,
  });

  final Widget child;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: ColorConstants.scaffoldBgColor,
      primary: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
         /* Positioned(
            top: -150,
            left: -150,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorConstants.secondaryColor.withValues(alpha: 0.3),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 150, sigmaY: 150),
                child: Container(color: Colors.transparent),
              ),
            ),
          ),*/

          // Positioned(
          //   top: -440,
          //   left: -336,
          //   child: Container(
          //     width: 591,
          //     height: 591,
          //     decoration: BoxDecoration(
          //       shape: BoxShape.circle,
          //       color: const Color(0x4D485DFE), // 30% opacity
          //     ),
          //     child: BackdropFilter(
          //       filter: ImageFilter.blur(sigmaX: 300, sigmaY: 300),
          //       child: Container(color: Colors.transparent),
          //     ),
          //   ),
          // ),
          child,
        ],
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
