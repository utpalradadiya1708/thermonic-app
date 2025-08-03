import 'package:freezed_annotation/freezed_annotation.dart';

part 'common_search_model_response.freezed.dart';
part 'common_search_model_response.g.dart';

@freezed
class CommonSearchModelResponse with _$CommonSearchModelResponse {
  const factory CommonSearchModelResponse({
    int? id,
    String? name,
    String? image,
    String? price,
    String? type,
  }) = _CommonSearchModelResponse;

  factory CommonSearchModelResponse.fromJson(Map<String, dynamic> json) =>
      _$CommonSearchModelResponseFromJson(json);
}
