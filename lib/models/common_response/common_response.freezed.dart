// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'common_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CommonResponse<T> _$CommonResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object?) fromJsonT,
) {
  return _CommonResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$CommonResponse<T> {
  bool get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  T? get data => throw _privateConstructorUsedError;

  /// Serializes this CommonResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of CommonResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommonResponseCopyWith<T, CommonResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonResponseCopyWith<T, $Res> {
  factory $CommonResponseCopyWith(
    CommonResponse<T> value,
    $Res Function(CommonResponse<T>) then,
  ) = _$CommonResponseCopyWithImpl<T, $Res, CommonResponse<T>>;
  @useResult
  $Res call({bool status, String message, T? data});
}

/// @nodoc
class _$CommonResponseCopyWithImpl<T, $Res, $Val extends CommonResponse<T>>
    implements $CommonResponseCopyWith<T, $Res> {
  _$CommonResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommonResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(
      _value.copyWith(
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as bool,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            data: freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as T?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CommonResponseImplCopyWith<T, $Res>
    implements $CommonResponseCopyWith<T, $Res> {
  factory _$$CommonResponseImplCopyWith(
    _$CommonResponseImpl<T> value,
    $Res Function(_$CommonResponseImpl<T>) then,
  ) = __$$CommonResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({bool status, String message, T? data});
}

/// @nodoc
class __$$CommonResponseImplCopyWithImpl<T, $Res>
    extends _$CommonResponseCopyWithImpl<T, $Res, _$CommonResponseImpl<T>>
    implements _$$CommonResponseImplCopyWith<T, $Res> {
  __$$CommonResponseImplCopyWithImpl(
    _$CommonResponseImpl<T> _value,
    $Res Function(_$CommonResponseImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of CommonResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(
      _$CommonResponseImpl<T>(
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as bool,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        data: freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as T?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$CommonResponseImpl<T> implements _CommonResponse<T> {
  const _$CommonResponseImpl({
    this.status = false,
    this.message = "",
    this.data,
  });

  factory _$CommonResponseImpl.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$$CommonResponseImplFromJson(json, fromJsonT);

  @override
  @JsonKey()
  final bool status;
  @override
  @JsonKey()
  final String message;
  @override
  final T? data;

  @override
  String toString() {
    return 'CommonResponse<$T>(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommonResponseImpl<T> &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    message,
    const DeepCollectionEquality().hash(data),
  );

  /// Create a copy of CommonResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommonResponseImplCopyWith<T, _$CommonResponseImpl<T>> get copyWith =>
      __$$CommonResponseImplCopyWithImpl<T, _$CommonResponseImpl<T>>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$CommonResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class _CommonResponse<T> implements CommonResponse<T> {
  const factory _CommonResponse({
    final bool status,
    final String message,
    final T? data,
  }) = _$CommonResponseImpl<T>;

  factory _CommonResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) = _$CommonResponseImpl<T>.fromJson;

  @override
  bool get status;
  @override
  String get message;
  @override
  T? get data;

  /// Create a copy of CommonResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommonResponseImplCopyWith<T, _$CommonResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
