import 'package:flutter/cupertino.dart';

class LearningItemModel {
  final String title;
  final int lessonCount;
  final String duration;
  final int completedModules;
  final int totalModules;
  final double progressPercent;
  final String imagePath;
  final Color bgColor;
  final LinearGradient? gradient;

  LearningItemModel({
    required this.title,
    this.gradient,
    required this.lessonCount,
    required this.duration,
    required this.completedModules,
    required this.totalModules,
    required this.progressPercent,
    required this.imagePath,
    required this.bgColor,
  });
}
