import 'package:freezed_annotation/freezed_annotation.dart';

part 'common_response.freezed.dart';
part 'common_response.g.dart';

@Freezed(genericArgumentFactories: true)
class CommonResponse<T> with _$CommonResponse {
  const factory CommonResponse({
    @Default(false) bool status,
    @Default("") String message,
    T? data,
  }) = _CommonResponse;

  factory CommonResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) data,
  ) => _$CommonResponseFromJson(json, data);
}
