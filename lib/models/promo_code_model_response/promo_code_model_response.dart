import 'package:freezed_annotation/freezed_annotation.dart';

part 'promo_code_model_response.freezed.dart';
part 'promo_code_model_response.g.dart';

@freezed
class PromoCodeModelResponse with _$PromoCodeModelResponse {
  const factory PromoCodeModelResponse({
    int? id,
    String? code,
    String? description,
    @JsonKey(name: 'discount_amount') String? discountAmount,
    String? type,
    @JsonKey(name: 'expiry_date') String? expiryDate,
  }) = _PromoCodeModelResponse;

  factory PromoCodeModelResponse.fromJson(Map<String, dynamic> json) =>
      _$PromoCodeModelResponseFromJson(json);
}
