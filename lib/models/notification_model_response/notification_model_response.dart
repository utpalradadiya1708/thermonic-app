import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model_response.freezed.dart';
part 'notification_model_response.g.dart';

@freezed
class NotificationModelResponse with _$NotificationModelResponse {
  const factory NotificationModelResponse({
    int? id,
    @JsonKey(name: 'redirect_to') String? redirectTo,
    @JsonKey(name: 'redirect_id') int? redirectId,
    String? title,
    String? message,
    String? image,
    @JsonKey(name: 'time_ago') String? timeAgo,
    String? type,
    int? seen,
  }) = _NotificationModelResponse;

  const NotificationModelResponse._();

  factory NotificationModelResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelResponseFromJson(json);
}
