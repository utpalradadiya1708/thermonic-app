import 'package:flutter/material.dart';
import 'package:thermonic/core/common/widget/question_shape_painter.dart';

class QuestionCard extends StatelessWidget {
  final Widget child;

  const QuestionCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: QuestionShapePainter(),
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
        width: double.infinity,
        // height: 100,
        child: child,
      ),
    );
  }
}
