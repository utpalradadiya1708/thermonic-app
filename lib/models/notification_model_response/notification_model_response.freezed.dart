// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_model_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

NotificationModelResponse _$NotificationModelResponseFromJson(
  Map<String, dynamic> json,
) {
  return _NotificationModelResponse.fromJson(json);
}

/// @nodoc
mixin _$NotificationModelResponse {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'redirect_to')
  String? get redirectTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'redirect_id')
  int? get redirectId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_ago')
  String? get timeAgo => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  int? get seen => throw _privateConstructorUsedError;

  /// Serializes this NotificationModelResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationModelResponseCopyWith<NotificationModelResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationModelResponseCopyWith<$Res> {
  factory $NotificationModelResponseCopyWith(
    NotificationModelResponse value,
    $Res Function(NotificationModelResponse) then,
  ) = _$NotificationModelResponseCopyWithImpl<$Res, NotificationModelResponse>;
  @useResult
  $Res call({
    int? id,
    @JsonKey(name: 'redirect_to') String? redirectTo,
    @JsonKey(name: 'redirect_id') int? redirectId,
    String? title,
    String? message,
    String? image,
    @JsonKey(name: 'time_ago') String? timeAgo,
    String? type,
    int? seen,
  });
}

/// @nodoc
class _$NotificationModelResponseCopyWithImpl<
  $Res,
  $Val extends NotificationModelResponse
>
    implements $NotificationModelResponseCopyWith<$Res> {
  _$NotificationModelResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? redirectTo = freezed,
    Object? redirectId = freezed,
    Object? title = freezed,
    Object? message = freezed,
    Object? image = freezed,
    Object? timeAgo = freezed,
    Object? type = freezed,
    Object? seen = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            redirectTo: freezed == redirectTo
                ? _value.redirectTo
                : redirectTo // ignore: cast_nullable_to_non_nullable
                      as String?,
            redirectId: freezed == redirectId
                ? _value.redirectId
                : redirectId // ignore: cast_nullable_to_non_nullable
                      as int?,
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
            image: freezed == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String?,
            timeAgo: freezed == timeAgo
                ? _value.timeAgo
                : timeAgo // ignore: cast_nullable_to_non_nullable
                      as String?,
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String?,
            seen: freezed == seen
                ? _value.seen
                : seen // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NotificationModelResponseImplCopyWith<$Res>
    implements $NotificationModelResponseCopyWith<$Res> {
  factory _$$NotificationModelResponseImplCopyWith(
    _$NotificationModelResponseImpl value,
    $Res Function(_$NotificationModelResponseImpl) then,
  ) = __$$NotificationModelResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    @JsonKey(name: 'redirect_to') String? redirectTo,
    @JsonKey(name: 'redirect_id') int? redirectId,
    String? title,
    String? message,
    String? image,
    @JsonKey(name: 'time_ago') String? timeAgo,
    String? type,
    int? seen,
  });
}

/// @nodoc
class __$$NotificationModelResponseImplCopyWithImpl<$Res>
    extends
        _$NotificationModelResponseCopyWithImpl<
          $Res,
          _$NotificationModelResponseImpl
        >
    implements _$$NotificationModelResponseImplCopyWith<$Res> {
  __$$NotificationModelResponseImplCopyWithImpl(
    _$NotificationModelResponseImpl _value,
    $Res Function(_$NotificationModelResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? redirectTo = freezed,
    Object? redirectId = freezed,
    Object? title = freezed,
    Object? message = freezed,
    Object? image = freezed,
    Object? timeAgo = freezed,
    Object? type = freezed,
    Object? seen = freezed,
  }) {
    return _then(
      _$NotificationModelResponseImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        redirectTo: freezed == redirectTo
            ? _value.redirectTo
            : redirectTo // ignore: cast_nullable_to_non_nullable
                  as String?,
        redirectId: freezed == redirectId
            ? _value.redirectId
            : redirectId // ignore: cast_nullable_to_non_nullable
                  as int?,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        image: freezed == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String?,
        timeAgo: freezed == timeAgo
            ? _value.timeAgo
            : timeAgo // ignore: cast_nullable_to_non_nullable
                  as String?,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String?,
        seen: freezed == seen
            ? _value.seen
            : seen // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationModelResponseImpl extends _NotificationModelResponse {
  const _$NotificationModelResponseImpl({
    this.id,
    @JsonKey(name: 'redirect_to') this.redirectTo,
    @JsonKey(name: 'redirect_id') this.redirectId,
    this.title,
    this.message,
    this.image,
    @JsonKey(name: 'time_ago') this.timeAgo,
    this.type,
    this.seen,
  }) : super._();

  factory _$NotificationModelResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationModelResponseImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'redirect_to')
  final String? redirectTo;
  @override
  @JsonKey(name: 'redirect_id')
  final int? redirectId;
  @override
  final String? title;
  @override
  final String? message;
  @override
  final String? image;
  @override
  @JsonKey(name: 'time_ago')
  final String? timeAgo;
  @override
  final String? type;
  @override
  final int? seen;

  @override
  String toString() {
    return 'NotificationModelResponse(id: $id, redirectTo: $redirectTo, redirectId: $redirectId, title: $title, message: $message, image: $image, timeAgo: $timeAgo, type: $type, seen: $seen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationModelResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.redirectTo, redirectTo) ||
                other.redirectTo == redirectTo) &&
            (identical(other.redirectId, redirectId) ||
                other.redirectId == redirectId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.timeAgo, timeAgo) || other.timeAgo == timeAgo) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.seen, seen) || other.seen == seen));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    redirectTo,
    redirectId,
    title,
    message,
    image,
    timeAgo,
    type,
    seen,
  );

  /// Create a copy of NotificationModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationModelResponseImplCopyWith<_$NotificationModelResponseImpl>
  get copyWith =>
      __$$NotificationModelResponseImplCopyWithImpl<
        _$NotificationModelResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationModelResponseImplToJson(this);
  }
}

abstract class _NotificationModelResponse extends NotificationModelResponse {
  const factory _NotificationModelResponse({
    final int? id,
    @JsonKey(name: 'redirect_to') final String? redirectTo,
    @JsonKey(name: 'redirect_id') final int? redirectId,
    final String? title,
    final String? message,
    final String? image,
    @JsonKey(name: 'time_ago') final String? timeAgo,
    final String? type,
    final int? seen,
  }) = _$NotificationModelResponseImpl;
  const _NotificationModelResponse._() : super._();

  factory _NotificationModelResponse.fromJson(Map<String, dynamic> json) =
      _$NotificationModelResponseImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'redirect_to')
  String? get redirectTo;
  @override
  @JsonKey(name: 'redirect_id')
  int? get redirectId;
  @override
  String? get title;
  @override
  String? get message;
  @override
  String? get image;
  @override
  @JsonKey(name: 'time_ago')
  String? get timeAgo;
  @override
  String? get type;
  @override
  int? get seen;

  /// Create a copy of NotificationModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationModelResponseImplCopyWith<_$NotificationModelResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
