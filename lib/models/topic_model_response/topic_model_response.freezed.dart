// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topic_model_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TopicModelResponse _$TopicModelResponseFromJson(Map<String, dynamic> json) {
  return _TopicModelResponse.fromJson(json);
}

/// @nodoc
mixin _$TopicModelResponse {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get video => throw _privateConstructorUsedError;
  String? get duration => throw _privateConstructorUsedError;
  @JsonKey(name: "thumbnail_image")
  String? get thumbnailImage => throw _privateConstructorUsedError;

  /// Serializes this TopicModelResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TopicModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TopicModelResponseCopyWith<TopicModelResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopicModelResponseCopyWith<$Res> {
  factory $TopicModelResponseCopyWith(
    TopicModelResponse value,
    $Res Function(TopicModelResponse) then,
  ) = _$TopicModelResponseCopyWithImpl<$Res, TopicModelResponse>;
  @useResult
  $Res call({
    int? id,
    String? name,
    String? video,
    String? duration,
    @JsonKey(name: "thumbnail_image") String? thumbnailImage,
  });
}

/// @nodoc
class _$TopicModelResponseCopyWithImpl<$Res, $Val extends TopicModelResponse>
    implements $TopicModelResponseCopyWith<$Res> {
  _$TopicModelResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TopicModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? video = freezed,
    Object? duration = freezed,
    Object? thumbnailImage = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            video: freezed == video
                ? _value.video
                : video // ignore: cast_nullable_to_non_nullable
                      as String?,
            duration: freezed == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as String?,
            thumbnailImage: freezed == thumbnailImage
                ? _value.thumbnailImage
                : thumbnailImage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TopicModelResponseImplCopyWith<$Res>
    implements $TopicModelResponseCopyWith<$Res> {
  factory _$$TopicModelResponseImplCopyWith(
    _$TopicModelResponseImpl value,
    $Res Function(_$TopicModelResponseImpl) then,
  ) = __$$TopicModelResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    String? name,
    String? video,
    String? duration,
    @JsonKey(name: "thumbnail_image") String? thumbnailImage,
  });
}

/// @nodoc
class __$$TopicModelResponseImplCopyWithImpl<$Res>
    extends _$TopicModelResponseCopyWithImpl<$Res, _$TopicModelResponseImpl>
    implements _$$TopicModelResponseImplCopyWith<$Res> {
  __$$TopicModelResponseImplCopyWithImpl(
    _$TopicModelResponseImpl _value,
    $Res Function(_$TopicModelResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TopicModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? video = freezed,
    Object? duration = freezed,
    Object? thumbnailImage = freezed,
  }) {
    return _then(
      _$TopicModelResponseImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        video: freezed == video
            ? _value.video
            : video // ignore: cast_nullable_to_non_nullable
                  as String?,
        duration: freezed == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as String?,
        thumbnailImage: freezed == thumbnailImage
            ? _value.thumbnailImage
            : thumbnailImage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TopicModelResponseImpl implements _TopicModelResponse {
  const _$TopicModelResponseImpl({
    this.id,
    this.name,
    this.video,
    this.duration,
    @JsonKey(name: "thumbnail_image") this.thumbnailImage,
  });

  factory _$TopicModelResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopicModelResponseImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? video;
  @override
  final String? duration;
  @override
  @JsonKey(name: "thumbnail_image")
  final String? thumbnailImage;

  @override
  String toString() {
    return 'TopicModelResponse(id: $id, name: $name, video: $video, duration: $duration, thumbnailImage: $thumbnailImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopicModelResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.thumbnailImage, thumbnailImage) ||
                other.thumbnailImage == thumbnailImage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, video, duration, thumbnailImage);

  /// Create a copy of TopicModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TopicModelResponseImplCopyWith<_$TopicModelResponseImpl> get copyWith =>
      __$$TopicModelResponseImplCopyWithImpl<_$TopicModelResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TopicModelResponseImplToJson(this);
  }
}

abstract class _TopicModelResponse implements TopicModelResponse {
  const factory _TopicModelResponse({
    final int? id,
    final String? name,
    final String? video,
    final String? duration,
    @JsonKey(name: "thumbnail_image") final String? thumbnailImage,
  }) = _$TopicModelResponseImpl;

  factory _TopicModelResponse.fromJson(Map<String, dynamic> json) =
      _$TopicModelResponseImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get video;
  @override
  String? get duration;
  @override
  @JsonKey(name: "thumbnail_image")
  String? get thumbnailImage;

  /// Create a copy of TopicModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TopicModelResponseImplCopyWith<_$TopicModelResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
