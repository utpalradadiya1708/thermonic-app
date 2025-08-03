import 'package:flutter/material.dart';

class AnimatedLinearProgress extends StatelessWidget {
  final double targetValue; // between 0.0 to 1.0
  final Duration duration;
  final Color backgroundColor;
  final Color progressColor;

  const AnimatedLinearProgress({
    super.key,
    required this.targetValue,
    this.duration = const Duration(seconds: 2),
    this.backgroundColor = Colors.grey,
    this.progressColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: targetValue),
      duration: duration,
      builder: (context, value, child) {
        return LinearProgressIndicator(
          value: value,
          borderRadius: BorderRadius.circular(35),
          backgroundColor: backgroundColor,
          valueColor: AlwaysStoppedAnimation<Color>(progressColor),
        );
      },
    );
  }
}
