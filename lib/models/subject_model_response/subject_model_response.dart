import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/common/widget/course_package_grid.dart';
import '../review_model_response/review_model_response.dart';
import '../semester_model_response/semester_model_response.dart';
import '../trainer_model_response/trainer_model_response.dart';

part 'subject_model_response.freezed.dart';
part 'subject_model_response.g.dart';

@freezed
class SubjectModelResponse with _$SubjectModelResponse implements CourseItem {
  const factory SubjectModelResponse({
    int? id,
    String? name,
    String? image,
    String? price,
    @JsonKey(name: 'is_ordered') bool? isOrdered,
    @JsonKey(name: 'order_id') int? orderId,
    @JsonKey(name: 'exam_attempted') bool? examAttempted,
    String? description,
    List<SemesterModelResponse>? semesters,
    TrainerModelResponse? trainer,
    @JsonKey(name: 'reviews') ReviewModelResponse? reviewData,
  }) = _SubjectModelResponse;

  // Add this getter implementation for CourseItem interface
  // This is needed because CourseItem expects String? id, but you have int? id
  const SubjectModelResponse._(); // Private constructor for custom methods

  @override
  factory SubjectModelResponse.fromJson(Map<String, dynamic> json) =>
      _$SubjectModelResponseFromJson(json);
}
