import 'package:flutter/material.dart';

import '../../theme/color_constants.dart';

class DottedLinePainter extends CustomPainter {
  DottedLinePainter({this.lineColor = ColorConstants.primaryColor});
  Color lineColor;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = size.width;

    const double dashHeight = 5;
    const double dashSpace = 2;
    double startY = 0;

    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
