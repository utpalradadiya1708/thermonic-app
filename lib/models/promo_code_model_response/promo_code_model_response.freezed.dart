// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promo_code_model_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PromoCodeModelResponse _$PromoCodeModelResponseFromJson(
  Map<String, dynamic> json,
) {
  return _PromoCodeModelResponse.fromJson(json);
}

/// @nodoc
mixin _$PromoCodeModelResponse {
  int? get id => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_amount')
  String? get discountAmount => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'expiry_date')
  String? get expiryDate => throw _privateConstructorUsedError;

  /// Serializes this PromoCodeModelResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PromoCodeModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PromoCodeModelResponseCopyWith<PromoCodeModelResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromoCodeModelResponseCopyWith<$Res> {
  factory $PromoCodeModelResponseCopyWith(
    PromoCodeModelResponse value,
    $Res Function(PromoCodeModelResponse) then,
  ) = _$PromoCodeModelResponseCopyWithImpl<$Res, PromoCodeModelResponse>;
  @useResult
  $Res call({
    int? id,
    String? code,
    String? description,
    @JsonKey(name: 'discount_amount') String? discountAmount,
    String? type,
    @JsonKey(name: 'expiry_date') String? expiryDate,
  });
}

/// @nodoc
class _$PromoCodeModelResponseCopyWithImpl<
  $Res,
  $Val extends PromoCodeModelResponse
>
    implements $PromoCodeModelResponseCopyWith<$Res> {
  _$PromoCodeModelResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PromoCodeModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? description = freezed,
    Object? discountAmount = freezed,
    Object? type = freezed,
    Object? expiryDate = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            code: freezed == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            discountAmount: freezed == discountAmount
                ? _value.discountAmount
                : discountAmount // ignore: cast_nullable_to_non_nullable
                      as String?,
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String?,
            expiryDate: freezed == expiryDate
                ? _value.expiryDate
                : expiryDate // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PromoCodeModelResponseImplCopyWith<$Res>
    implements $PromoCodeModelResponseCopyWith<$Res> {
  factory _$$PromoCodeModelResponseImplCopyWith(
    _$PromoCodeModelResponseImpl value,
    $Res Function(_$PromoCodeModelResponseImpl) then,
  ) = __$$PromoCodeModelResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    String? code,
    String? description,
    @JsonKey(name: 'discount_amount') String? discountAmount,
    String? type,
    @JsonKey(name: 'expiry_date') String? expiryDate,
  });
}

/// @nodoc
class __$$PromoCodeModelResponseImplCopyWithImpl<$Res>
    extends
        _$PromoCodeModelResponseCopyWithImpl<$Res, _$PromoCodeModelResponseImpl>
    implements _$$PromoCodeModelResponseImplCopyWith<$Res> {
  __$$PromoCodeModelResponseImplCopyWithImpl(
    _$PromoCodeModelResponseImpl _value,
    $Res Function(_$PromoCodeModelResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PromoCodeModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? description = freezed,
    Object? discountAmount = freezed,
    Object? type = freezed,
    Object? expiryDate = freezed,
  }) {
    return _then(
      _$PromoCodeModelResponseImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        code: freezed == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        discountAmount: freezed == discountAmount
            ? _value.discountAmount
            : discountAmount // ignore: cast_nullable_to_non_nullable
                  as String?,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String?,
        expiryDate: freezed == expiryDate
            ? _value.expiryDate
            : expiryDate // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PromoCodeModelResponseImpl implements _PromoCodeModelResponse {
  const _$PromoCodeModelResponseImpl({
    this.id,
    this.code,
    this.description,
    @JsonKey(name: 'discount_amount') this.discountAmount,
    this.type,
    @JsonKey(name: 'expiry_date') this.expiryDate,
  });

  factory _$PromoCodeModelResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PromoCodeModelResponseImplFromJson(json);

  @override
  final int? id;
  @override
  final String? code;
  @override
  final String? description;
  @override
  @JsonKey(name: 'discount_amount')
  final String? discountAmount;
  @override
  final String? type;
  @override
  @JsonKey(name: 'expiry_date')
  final String? expiryDate;

  @override
  String toString() {
    return 'PromoCodeModelResponse(id: $id, code: $code, description: $description, discountAmount: $discountAmount, type: $type, expiryDate: $expiryDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PromoCodeModelResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    code,
    description,
    discountAmount,
    type,
    expiryDate,
  );

  /// Create a copy of PromoCodeModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PromoCodeModelResponseImplCopyWith<_$PromoCodeModelResponseImpl>
  get copyWith =>
      __$$PromoCodeModelResponseImplCopyWithImpl<_$PromoCodeModelResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PromoCodeModelResponseImplToJson(this);
  }
}

abstract class _PromoCodeModelResponse implements PromoCodeModelResponse {
  const factory _PromoCodeModelResponse({
    final int? id,
    final String? code,
    final String? description,
    @JsonKey(name: 'discount_amount') final String? discountAmount,
    final String? type,
    @JsonKey(name: 'expiry_date') final String? expiryDate,
  }) = _$PromoCodeModelResponseImpl;

  factory _PromoCodeModelResponse.fromJson(Map<String, dynamic> json) =
      _$PromoCodeModelResponseImpl.fromJson;

  @override
  int? get id;
  @override
  String? get code;
  @override
  String? get description;
  @override
  @JsonKey(name: 'discount_amount')
  String? get discountAmount;
  @override
  String? get type;
  @override
  @JsonKey(name: 'expiry_date')
  String? get expiryDate;

  /// Create a copy of PromoCodeModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PromoCodeModelResponseImplCopyWith<_$PromoCodeModelResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
