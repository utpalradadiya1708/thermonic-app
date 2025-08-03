import 'package:freezed_annotation/freezed_annotation.dart';

import '../exam_model_response/exam_model_response.dart';
import '../subject_model_response/subject_model_response.dart';
import '../user_model_response/user_model_response.dart';

part 'home_model_response.freezed.dart';
part 'home_model_response.g.dart';

@freezed
class HomeModelResponse with _$HomeModelResponse {
  const factory HomeModelResponse({
    List<SubjectModelResponse>? subjects,
    @JsonKey(name: "subjects_view_all") bool? subjectsViewAll,
    List<ExamModelResponse>? exams,
    @JsonKey(name: "exam_view_all") bool? examViewAll,
    @JsonKey(name: "notification_count") int? notificationCount,
    List<GradeModel>? grades,
  }) = _HomeModelResponse;

  factory HomeModelResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeModelResponseFromJson(json);
}
