import 'package:freezed_annotation/freezed_annotation.dart';

part 'topic_model_response.freezed.dart';
part 'topic_model_response.g.dart';

@freezed
class TopicModelResponse with _$TopicModelResponse {
  const factory TopicModelResponse({
    int? id,
    String? name,
    String? video,
    String? duration,
    @JsonKey(name: "thumbnail_image") String? thumbnailImage,
  }) = _TopicModelResponse;

  factory TopicModelResponse.fromJson(Map<String, dynamic> json) =>
      _$TopicModelResponseFromJson(json);
}
