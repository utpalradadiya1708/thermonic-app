import 'dart:math';

import 'package:flutter/material.dart';

import '../constants/image_constants.dart';

class CustomLoadingOverlay extends StatefulWidget {
  final Color? backgroundColor;

  const CustomLoadingOverlay({super.key, this.backgroundColor});
  @override
  State<CustomLoadingOverlay> createState() => _CustomLoadingOverlayState();
}

class _CustomLoadingOverlayState extends State<CustomLoadingOverlay>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ), // Adjust the animation duration as needed
    )..repeat();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  // Background color property
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      color: widget.backgroundColor,
      // Set the background color here
      child: Center(
        child: AnimatedBuilder(
          animation: _controller!,
          child: Image.asset(
            height: 30,
            width: 30,
            ImageConstants.icRoundAppIcon,
          ),
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..rotateY(_controller!.value * 2 * pi),
              child: child, // Apply flip effect
            );
          },
        ),
      ),
    );
  }
}
