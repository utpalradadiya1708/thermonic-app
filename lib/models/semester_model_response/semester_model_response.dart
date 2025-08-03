import 'package:freezed_annotation/freezed_annotation.dart';

import '../chapter_model_response/chapter_model_response.dart';

part 'semester_model_response.freezed.dart';
part 'semester_model_response.g.dart';

@freezed
class SemesterModelResponse with _$SemesterModelResponse {
  const factory SemesterModelResponse({
    int? id,
    String? name,
    String? price,
    @JsonKey(name: 'is_ordered') bool? isOrdered,
    @JsonKey(name: 'order_id') int? orderId,
    List<ChapterModelResponse>? chapters,
  }) = _SemesterModelResponse;

  factory SemesterModelResponse.fromJson(Map<String, dynamic> json) =>
      _$SemesterModelResponseFromJson(json);
}
