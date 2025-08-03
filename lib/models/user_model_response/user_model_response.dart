import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model_response.freezed.dart';
part 'user_model_response.g.dart';

@freezed
class UserModelResponse with _$UserModelResponse {
  const factory UserModelResponse({
    required UserData user,
    List<GradeModel>? grades,
  }) = _UserModelResponse;

  factory UserModelResponse.fromJson(Map<String, dynamic> json) =>
      _$UserModelResponseFromJson(json);
}

@freezed
class UserData with _$UserData {
  const factory UserData({
    int? id,
    String? name,
    String? phone,
    @JsonKey(name: "phone_formatted") String? phoneFormatted,
    String? email,
    @JsonKey(name: "grade_id") int? gradeId,
    @JsonKey(name: "stream_id") int? streamId,
    @JsonKey(name: "profile_picture_full_url") String? profilePictureFullUrl,
    String? language,
    bool? isProfileSetup,
    String? token,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}

@freezed
class GradeModel with _$GradeModel {
  const factory GradeModel({
    int? id,
    String? name,
    List<StreamModel>? streams,
  }) = _GradeModel;

  factory GradeModel.fromJson(Map<String, dynamic> json) =>
      _$GradeModelFromJson(json);
}

extension GradeModelX on GradeModel {
  bool get requiresStreamSelection => streams?.isNotEmpty ?? false;
}

@freezed
class StreamModel with _$StreamModel {
  const factory StreamModel({int? id, String? name}) = _StreamModel;
  factory StreamModel.fromJson(Map<String, dynamic> json) =>
      _$StreamModelFromJson(json);
}
