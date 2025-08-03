import 'package:freezed_annotation/freezed_annotation.dart';

part 'init_model_response.freezed.dart';
part 'init_model_response.g.dart';

@freezed
class InitModelResponse with _$InitModelResponse {
  const factory InitModelResponse({
    @JsonKey(name: 'force_update') bool? forceUpdate,
    bool? update,
    bool? maintenance,
    @JsonKey(name: 'terms_and_conditions') String? termsAndConditions,
    @JsonKey(name: 'privacy_policy') String? privacyPolicy,
    @JsonKey(name: 'about_us') String? aboutUs,
    @JsonKey(name: 'support_number') String? supportNumber,
    @JsonKey(name: 'support_email') String? supportEmail,
    @JsonKey(name: 'ig_link') String? igLink,
    @JsonKey(name: 'tg_link') String? tgLink,
    @JsonKey(name: 'fb_link') String? fbLink,
    @JsonKey(name: 'whatsapp_link') String? whatsappLink,
    @JsonKey(name: 'isProfileSetup') bool? isProfileSetup,
  }) = _InitModelResponse;

  factory InitModelResponse.fromJson(Map<String, dynamic> json) =>
      _$InitModelResponseFromJson(json);
}
