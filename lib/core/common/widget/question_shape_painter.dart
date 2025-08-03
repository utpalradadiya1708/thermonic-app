import 'package:flutter/material.dart';

class QuestionShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFF971EFF), Color(0xFF5921FF)],
    );

    final paint = Paint()
      ..shader = gradient.createShader(
        Rect.fromLTWH(0, 0, size.width, size.height),
      )
      ..style = PaintingStyle.fill;
    // final paint = Paint()
    //   ..color = const Color(0xFF8A2BE2)
    //   ..style = PaintingStyle.fill;

    // final double cornerRadius = size.width * 0.05;
    // final double peakHeight = size.height * 0.12;

    // final double cornerRadius = size.width.clamp(10, 30);
    // final double peakHeight = size.height * 0.12;

    final double cornerRadius = 20;
    final double peakHeight = 25; // How high the mountain peak rises

    final path = Path();

    // Start bottom-left rounded corner
    path.moveTo(cornerRadius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - cornerRadius);

    // Left side up to top-left rounded corner
    path.lineTo(0, cornerRadius);
    path.quadraticBezierTo(0, 0, 20, 0);

    // From top-left corner, line UP to peak center
    path.lineTo(size.width * 0.5, -peakHeight);

    // From peak center, line DOWN to top-right corner start (before rounding)
    path.lineTo(size.width - cornerRadius, 0);

    // Top-right rounded corner
    path.quadraticBezierTo(size.width, 0, size.width, cornerRadius);

    // Right side down to bottom-right rounded corner
    path.lineTo(size.width, size.height - cornerRadius);
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width - cornerRadius,
      size.height,
    );

    // Bottom edge back to start
    path.lineTo(cornerRadius, size.height);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
