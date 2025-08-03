// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InitModelResponseImpl _$$InitModelResponseImplFromJson(
  Map<String, dynamic> json,
) => _$InitModelResponseImpl(
  forceUpdate: json['force_update'] as bool?,
  update: json['update'] as bool?,
  maintenance: json['maintenance'] as bool?,
  termsAndConditions: json['terms_and_conditions'] as String?,
  privacyPolicy: json['privacy_policy'] as String?,
  aboutUs: json['about_us'] as String?,
  supportNumber: json['support_number'] as String?,
  supportEmail: json['support_email'] as String?,
  igLink: json['ig_link'] as String?,
  tgLink: json['tg_link'] as String?,
  fbLink: json['fb_link'] as String?,
  whatsappLink: json['whatsapp_link'] as String?,
  isProfileSetup: json['isProfileSetup'] as bool?,
);

Map<String, dynamic> _$$InitModelResponseImplToJson(
  _$InitModelResponseImpl instance,
) => <String, dynamic>{
  'force_update': instance.forceUpdate,
  'update': instance.update,
  'maintenance': instance.maintenance,
  'terms_and_conditions': instance.termsAndConditions,
  'privacy_policy': instance.privacyPolicy,
  'about_us': instance.aboutUs,
  'support_number': instance.supportNumber,
  'support_email': instance.supportEmail,
  'ig_link': instance.igLink,
  'tg_link': instance.tgLink,
  'fb_link': instance.fbLink,
  'whatsapp_link': instance.whatsappLink,
  'isProfileSetup': instance.isProfileSetup,
};
