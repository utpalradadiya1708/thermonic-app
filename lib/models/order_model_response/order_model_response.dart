import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/common/widget/course_package_grid.dart';

part 'order_model_response.freezed.dart';
part 'order_model_response.g.dart';

@freezed
class OrderModelResponse with _$OrderModelResponse implements CourseItem {
  const factory OrderModelResponse({
    int? id,
    String? total,
    String? name,
    String? image,
    String? type,
    @JsonKey(name: 'expiry_days_remaining') int? expiryDaysRemaining,
    @JsonKey(name: 'subject_id') int? subjectId,
    @JsonKey(name: 'grade_id') int? gradeId,
    @JsonKey(name: 'stream_id') int? streamId,
    @JsonKey(name: 'is_expired') bool? isExpired,
    @JsonKey(name: 'grade_name') String? gradeName,
    @JsonKey(name: 'stream_name') String? streamName,
    @JsonKey(name: 'created_date') String? createdDate,
    @JsonKey(name: 'expiry_date') String? expiryDate,
    @JsonKey(name: 'semester_name') String? semesterName,
    @JsonKey(name: 'exam_attempted') bool? examAttempted,
  }) = _OrderModelResponse;

  const OrderModelResponse._();

  factory OrderModelResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderModelResponseFromJson(json);
}
