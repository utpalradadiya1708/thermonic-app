// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_model_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TrainerModelResponse _$TrainerModelResponseFromJson(Map<String, dynamic> json) {
  return _TrainerModelResponse.fromJson(json);
}

/// @nodoc
mixin _$TrainerModelResponse {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  /// Serializes this TrainerModelResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TrainerModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrainerModelResponseCopyWith<TrainerModelResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainerModelResponseCopyWith<$Res> {
  factory $TrainerModelResponseCopyWith(
    TrainerModelResponse value,
    $Res Function(TrainerModelResponse) then,
  ) = _$TrainerModelResponseCopyWithImpl<$Res, TrainerModelResponse>;
  @useResult
  $Res call({int? id, String? name, String? image});
}

/// @nodoc
class _$TrainerModelResponseCopyWithImpl<
  $Res,
  $Val extends TrainerModelResponse
>
    implements $TrainerModelResponseCopyWith<$Res> {
  _$TrainerModelResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrainerModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
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
            image: freezed == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TrainerModelResponseImplCopyWith<$Res>
    implements $TrainerModelResponseCopyWith<$Res> {
  factory _$$TrainerModelResponseImplCopyWith(
    _$TrainerModelResponseImpl value,
    $Res Function(_$TrainerModelResponseImpl) then,
  ) = __$$TrainerModelResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, String? image});
}

/// @nodoc
class __$$TrainerModelResponseImplCopyWithImpl<$Res>
    extends _$TrainerModelResponseCopyWithImpl<$Res, _$TrainerModelResponseImpl>
    implements _$$TrainerModelResponseImplCopyWith<$Res> {
  __$$TrainerModelResponseImplCopyWithImpl(
    _$TrainerModelResponseImpl _value,
    $Res Function(_$TrainerModelResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TrainerModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
  }) {
    return _then(
      _$TrainerModelResponseImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        image: freezed == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TrainerModelResponseImpl implements _TrainerModelResponse {
  const _$TrainerModelResponseImpl({this.id, this.name, this.image});

  factory _$TrainerModelResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrainerModelResponseImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? image;

  @override
  String toString() {
    return 'TrainerModelResponse(id: $id, name: $name, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrainerModelResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, image);

  /// Create a copy of TrainerModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrainerModelResponseImplCopyWith<_$TrainerModelResponseImpl>
  get copyWith =>
      __$$TrainerModelResponseImplCopyWithImpl<_$TrainerModelResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TrainerModelResponseImplToJson(this);
  }
}

abstract class _TrainerModelResponse implements TrainerModelResponse {
  const factory _TrainerModelResponse({
    final int? id,
    final String? name,
    final String? image,
  }) = _$TrainerModelResponseImpl;

  factory _TrainerModelResponse.fromJson(Map<String, dynamic> json) =
      _$TrainerModelResponseImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get image;

  /// Create a copy of TrainerModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrainerModelResponseImplCopyWith<_$TrainerModelResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
