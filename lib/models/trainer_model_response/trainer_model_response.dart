import 'package:freezed_annotation/freezed_annotation.dart';

part 'trainer_model_response.freezed.dart';
part 'trainer_model_response.g.dart';

@freezed
class TrainerModelResponse with _$TrainerModelResponse {
  const factory TrainerModelResponse({int? id, String? name, String? image}) =
      _TrainerModelResponse;

  factory TrainerModelResponse.fromJson(Map<String, dynamic> json) =>
      _$TrainerModelResponseFromJson(json);
}
