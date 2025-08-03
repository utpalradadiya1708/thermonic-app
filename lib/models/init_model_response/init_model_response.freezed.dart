// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'init_model_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

InitModelResponse _$InitModelResponseFromJson(Map<String, dynamic> json) {
  return _InitModelResponse.fromJson(json);
}

/// @nodoc
mixin _$InitModelResponse {
  @JsonKey(name: 'force_update')
  bool? get forceUpdate => throw _privateConstructorUsedError;
  bool? get update => throw _privateConstructorUsedError;
  bool? get maintenance => throw _privateConstructorUsedError;
  @JsonKey(name: 'terms_and_conditions')
  String? get termsAndConditions => throw _privateConstructorUsedError;
  @JsonKey(name: 'privacy_policy')
  String? get privacyPolicy => throw _privateConstructorUsedError;
  @JsonKey(name: 'about_us')
  String? get aboutUs => throw _privateConstructorUsedError;
  @JsonKey(name: 'support_number')
  String? get supportNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'support_email')
  String? get supportEmail => throw _privateConstructorUsedError;
  @JsonKey(name: 'ig_link')
  String? get igLink => throw _privateConstructorUsedError;
  @JsonKey(name: 'tg_link')
  String? get tgLink => throw _privateConstructorUsedError;
  @JsonKey(name: 'fb_link')
  String? get fbLink => throw _privateConstructorUsedError;
  @JsonKey(name: 'whatsapp_link')
  String? get whatsappLink => throw _privateConstructorUsedError;
  @JsonKey(name: 'isProfileSetup')
  bool? get isProfileSetup => throw _privateConstructorUsedError;

  /// Serializes this InitModelResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InitModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InitModelResponseCopyWith<InitModelResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitModelResponseCopyWith<$Res> {
  factory $InitModelResponseCopyWith(
    InitModelResponse value,
    $Res Function(InitModelResponse) then,
  ) = _$InitModelResponseCopyWithImpl<$Res, InitModelResponse>;
  @useResult
  $Res call({
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
  });
}

/// @nodoc
class _$InitModelResponseCopyWithImpl<$Res, $Val extends InitModelResponse>
    implements $InitModelResponseCopyWith<$Res> {
  _$InitModelResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InitModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? forceUpdate = freezed,
    Object? update = freezed,
    Object? maintenance = freezed,
    Object? termsAndConditions = freezed,
    Object? privacyPolicy = freezed,
    Object? aboutUs = freezed,
    Object? supportNumber = freezed,
    Object? supportEmail = freezed,
    Object? igLink = freezed,
    Object? tgLink = freezed,
    Object? fbLink = freezed,
    Object? whatsappLink = freezed,
    Object? isProfileSetup = freezed,
  }) {
    return _then(
      _value.copyWith(
            forceUpdate: freezed == forceUpdate
                ? _value.forceUpdate
                : forceUpdate // ignore: cast_nullable_to_non_nullable
                      as bool?,
            update: freezed == update
                ? _value.update
                : update // ignore: cast_nullable_to_non_nullable
                      as bool?,
            maintenance: freezed == maintenance
                ? _value.maintenance
                : maintenance // ignore: cast_nullable_to_non_nullable
                      as bool?,
            termsAndConditions: freezed == termsAndConditions
                ? _value.termsAndConditions
                : termsAndConditions // ignore: cast_nullable_to_non_nullable
                      as String?,
            privacyPolicy: freezed == privacyPolicy
                ? _value.privacyPolicy
                : privacyPolicy // ignore: cast_nullable_to_non_nullable
                      as String?,
            aboutUs: freezed == aboutUs
                ? _value.aboutUs
                : aboutUs // ignore: cast_nullable_to_non_nullable
                      as String?,
            supportNumber: freezed == supportNumber
                ? _value.supportNumber
                : supportNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            supportEmail: freezed == supportEmail
                ? _value.supportEmail
                : supportEmail // ignore: cast_nullable_to_non_nullable
                      as String?,
            igLink: freezed == igLink
                ? _value.igLink
                : igLink // ignore: cast_nullable_to_non_nullable
                      as String?,
            tgLink: freezed == tgLink
                ? _value.tgLink
                : tgLink // ignore: cast_nullable_to_non_nullable
                      as String?,
            fbLink: freezed == fbLink
                ? _value.fbLink
                : fbLink // ignore: cast_nullable_to_non_nullable
                      as String?,
            whatsappLink: freezed == whatsappLink
                ? _value.whatsappLink
                : whatsappLink // ignore: cast_nullable_to_non_nullable
                      as String?,
            isProfileSetup: freezed == isProfileSetup
                ? _value.isProfileSetup
                : isProfileSetup // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InitModelResponseImplCopyWith<$Res>
    implements $InitModelResponseCopyWith<$Res> {
  factory _$$InitModelResponseImplCopyWith(
    _$InitModelResponseImpl value,
    $Res Function(_$InitModelResponseImpl) then,
  ) = __$$InitModelResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
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
  });
}

/// @nodoc
class __$$InitModelResponseImplCopyWithImpl<$Res>
    extends _$InitModelResponseCopyWithImpl<$Res, _$InitModelResponseImpl>
    implements _$$InitModelResponseImplCopyWith<$Res> {
  __$$InitModelResponseImplCopyWithImpl(
    _$InitModelResponseImpl _value,
    $Res Function(_$InitModelResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InitModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? forceUpdate = freezed,
    Object? update = freezed,
    Object? maintenance = freezed,
    Object? termsAndConditions = freezed,
    Object? privacyPolicy = freezed,
    Object? aboutUs = freezed,
    Object? supportNumber = freezed,
    Object? supportEmail = freezed,
    Object? igLink = freezed,
    Object? tgLink = freezed,
    Object? fbLink = freezed,
    Object? whatsappLink = freezed,
    Object? isProfileSetup = freezed,
  }) {
    return _then(
      _$InitModelResponseImpl(
        forceUpdate: freezed == forceUpdate
            ? _value.forceUpdate
            : forceUpdate // ignore: cast_nullable_to_non_nullable
                  as bool?,
        update: freezed == update
            ? _value.update
            : update // ignore: cast_nullable_to_non_nullable
                  as bool?,
        maintenance: freezed == maintenance
            ? _value.maintenance
            : maintenance // ignore: cast_nullable_to_non_nullable
                  as bool?,
        termsAndConditions: freezed == termsAndConditions
            ? _value.termsAndConditions
            : termsAndConditions // ignore: cast_nullable_to_non_nullable
                  as String?,
        privacyPolicy: freezed == privacyPolicy
            ? _value.privacyPolicy
            : privacyPolicy // ignore: cast_nullable_to_non_nullable
                  as String?,
        aboutUs: freezed == aboutUs
            ? _value.aboutUs
            : aboutUs // ignore: cast_nullable_to_non_nullable
                  as String?,
        supportNumber: freezed == supportNumber
            ? _value.supportNumber
            : supportNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        supportEmail: freezed == supportEmail
            ? _value.supportEmail
            : supportEmail // ignore: cast_nullable_to_non_nullable
                  as String?,
        igLink: freezed == igLink
            ? _value.igLink
            : igLink // ignore: cast_nullable_to_non_nullable
                  as String?,
        tgLink: freezed == tgLink
            ? _value.tgLink
            : tgLink // ignore: cast_nullable_to_non_nullable
                  as String?,
        fbLink: freezed == fbLink
            ? _value.fbLink
            : fbLink // ignore: cast_nullable_to_non_nullable
                  as String?,
        whatsappLink: freezed == whatsappLink
            ? _value.whatsappLink
            : whatsappLink // ignore: cast_nullable_to_non_nullable
                  as String?,
        isProfileSetup: freezed == isProfileSetup
            ? _value.isProfileSetup
            : isProfileSetup // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InitModelResponseImpl implements _InitModelResponse {
  const _$InitModelResponseImpl({
    @JsonKey(name: 'force_update') this.forceUpdate,
    this.update,
    this.maintenance,
    @JsonKey(name: 'terms_and_conditions') this.termsAndConditions,
    @JsonKey(name: 'privacy_policy') this.privacyPolicy,
    @JsonKey(name: 'about_us') this.aboutUs,
    @JsonKey(name: 'support_number') this.supportNumber,
    @JsonKey(name: 'support_email') this.supportEmail,
    @JsonKey(name: 'ig_link') this.igLink,
    @JsonKey(name: 'tg_link') this.tgLink,
    @JsonKey(name: 'fb_link') this.fbLink,
    @JsonKey(name: 'whatsapp_link') this.whatsappLink,
    @JsonKey(name: 'isProfileSetup') this.isProfileSetup,
  });

  factory _$InitModelResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$InitModelResponseImplFromJson(json);

  @override
  @JsonKey(name: 'force_update')
  final bool? forceUpdate;
  @override
  final bool? update;
  @override
  final bool? maintenance;
  @override
  @JsonKey(name: 'terms_and_conditions')
  final String? termsAndConditions;
  @override
  @JsonKey(name: 'privacy_policy')
  final String? privacyPolicy;
  @override
  @JsonKey(name: 'about_us')
  final String? aboutUs;
  @override
  @JsonKey(name: 'support_number')
  final String? supportNumber;
  @override
  @JsonKey(name: 'support_email')
  final String? supportEmail;
  @override
  @JsonKey(name: 'ig_link')
  final String? igLink;
  @override
  @JsonKey(name: 'tg_link')
  final String? tgLink;
  @override
  @JsonKey(name: 'fb_link')
  final String? fbLink;
  @override
  @JsonKey(name: 'whatsapp_link')
  final String? whatsappLink;
  @override
  @JsonKey(name: 'isProfileSetup')
  final bool? isProfileSetup;

  @override
  String toString() {
    return 'InitModelResponse(forceUpdate: $forceUpdate, update: $update, maintenance: $maintenance, termsAndConditions: $termsAndConditions, privacyPolicy: $privacyPolicy, aboutUs: $aboutUs, supportNumber: $supportNumber, supportEmail: $supportEmail, igLink: $igLink, tgLink: $tgLink, fbLink: $fbLink, whatsappLink: $whatsappLink, isProfileSetup: $isProfileSetup)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitModelResponseImpl &&
            (identical(other.forceUpdate, forceUpdate) ||
                other.forceUpdate == forceUpdate) &&
            (identical(other.update, update) || other.update == update) &&
            (identical(other.maintenance, maintenance) ||
                other.maintenance == maintenance) &&
            (identical(other.termsAndConditions, termsAndConditions) ||
                other.termsAndConditions == termsAndConditions) &&
            (identical(other.privacyPolicy, privacyPolicy) ||
                other.privacyPolicy == privacyPolicy) &&
            (identical(other.aboutUs, aboutUs) || other.aboutUs == aboutUs) &&
            (identical(other.supportNumber, supportNumber) ||
                other.supportNumber == supportNumber) &&
            (identical(other.supportEmail, supportEmail) ||
                other.supportEmail == supportEmail) &&
            (identical(other.igLink, igLink) || other.igLink == igLink) &&
            (identical(other.tgLink, tgLink) || other.tgLink == tgLink) &&
            (identical(other.fbLink, fbLink) || other.fbLink == fbLink) &&
            (identical(other.whatsappLink, whatsappLink) ||
                other.whatsappLink == whatsappLink) &&
            (identical(other.isProfileSetup, isProfileSetup) ||
                other.isProfileSetup == isProfileSetup));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    forceUpdate,
    update,
    maintenance,
    termsAndConditions,
    privacyPolicy,
    aboutUs,
    supportNumber,
    supportEmail,
    igLink,
    tgLink,
    fbLink,
    whatsappLink,
    isProfileSetup,
  );

  /// Create a copy of InitModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitModelResponseImplCopyWith<_$InitModelResponseImpl> get copyWith =>
      __$$InitModelResponseImplCopyWithImpl<_$InitModelResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$InitModelResponseImplToJson(this);
  }
}

abstract class _InitModelResponse implements InitModelResponse {
  const factory _InitModelResponse({
    @JsonKey(name: 'force_update') final bool? forceUpdate,
    final bool? update,
    final bool? maintenance,
    @JsonKey(name: 'terms_and_conditions') final String? termsAndConditions,
    @JsonKey(name: 'privacy_policy') final String? privacyPolicy,
    @JsonKey(name: 'about_us') final String? aboutUs,
    @JsonKey(name: 'support_number') final String? supportNumber,
    @JsonKey(name: 'support_email') final String? supportEmail,
    @JsonKey(name: 'ig_link') final String? igLink,
    @JsonKey(name: 'tg_link') final String? tgLink,
    @JsonKey(name: 'fb_link') final String? fbLink,
    @JsonKey(name: 'whatsapp_link') final String? whatsappLink,
    @JsonKey(name: 'isProfileSetup') final bool? isProfileSetup,
  }) = _$InitModelResponseImpl;

  factory _InitModelResponse.fromJson(Map<String, dynamic> json) =
      _$InitModelResponseImpl.fromJson;

  @override
  @JsonKey(name: 'force_update')
  bool? get forceUpdate;
  @override
  bool? get update;
  @override
  bool? get maintenance;
  @override
  @JsonKey(name: 'terms_and_conditions')
  String? get termsAndConditions;
  @override
  @JsonKey(name: 'privacy_policy')
  String? get privacyPolicy;
  @override
  @JsonKey(name: 'about_us')
  String? get aboutUs;
  @override
  @JsonKey(name: 'support_number')
  String? get supportNumber;
  @override
  @JsonKey(name: 'support_email')
  String? get supportEmail;
  @override
  @JsonKey(name: 'ig_link')
  String? get igLink;
  @override
  @JsonKey(name: 'tg_link')
  String? get tgLink;
  @override
  @JsonKey(name: 'fb_link')
  String? get fbLink;
  @override
  @JsonKey(name: 'whatsapp_link')
  String? get whatsappLink;
  @override
  @JsonKey(name: 'isProfileSetup')
  bool? get isProfileSetup;

  /// Create a copy of InitModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitModelResponseImplCopyWith<_$InitModelResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
