import 'package:thermonic/models/semester_model.dart';

import 'instructor_model.dart';

class CourseModel {
  final String title;
  final String imageUrl;
  final String description;
  final List<SemesterModel> semesters;
  final InstructorModel instructor;

  CourseModel({
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.semesters,
    required this.instructor,
  });
}
