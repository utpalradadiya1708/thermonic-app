import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thermonic/models/subject_model_response/subject_model_response.dart';
import 'package:thermonic/models/topic_model_response/topic_model_response.dart';
import 'package:thermonic/models/trainer_model_response/trainer_model_response.dart';

import '../user_model_response/user_model_response.dart';

part 'chapter_model_response.freezed.dart';
part 'chapter_model_response.g.dart';

@freezed
class ChapterModelResponse with _$ChapterModelResponse {
  const factory ChapterModelResponse({
    int? id,
    String? name,
    String? rating,
    @JsonKey(name: 'review_count') String? reviewCount,
    String? price,
    String? description,
    int? progess,
    @JsonKey(name: 'pdf_url') String? pdfUrl,
    @JsonKey(name: 'is_free') bool? isFree,
    @JsonKey(name: 'is_ordered') bool? isOrdered,
    @JsonKey(name: 'order_id') int? orderId,
    @JsonKey(name: 'semester_id') int? semesterId,
    @JsonKey(name: 'exam_attempted') bool? isExamAttempted,
    SubjectModelResponse? subject,
    TrainerModelResponse? trainer,
    GradeModel? grade,
    StreamModel? stream,
    @JsonKey(name: 'saved') bool? saved,
    List<TopicModelResponse>? topics,
  }) = _ChapterModelResponse;

  factory ChapterModelResponse.fromJson(Map<String, dynamic> json) =>
      _$ChapterModelResponseFromJson(json);
}
