// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promo_code_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PromoCodeModelResponseImpl _$$PromoCodeModelResponseImplFromJson(
  Map<String, dynamic> json,
) => _$PromoCodeModelResponseImpl(
  id: (json['id'] as num?)?.toInt(),
  code: json['code'] as String?,
  description: json['description'] as String?,
  discountAmount: json['discount_amount'] as String?,
  type: json['type'] as String?,
  expiryDate: json['expiry_date'] as String?,
);

Map<String, dynamic> _$$PromoCodeModelResponseImplToJson(
  _$PromoCodeModelResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'description': instance.description,
  'discount_amount': instance.discountAmount,
  'type': instance.type,
  'expiry_date': instance.expiryDate,
};
