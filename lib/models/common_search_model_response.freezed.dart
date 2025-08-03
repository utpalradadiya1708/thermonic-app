// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'common_search_model_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CommonSearchModelResponse _$CommonSearchModelResponseFromJson(
  Map<String, dynamic> json,
) {
  return _CommonSearchModelResponse.fromJson(json);
}

/// @nodoc
mixin _$CommonSearchModelResponse {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get price => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  /// Serializes this CommonSearchModelResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommonSearchModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommonSearchModelResponseCopyWith<CommonSearchModelResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonSearchModelResponseCopyWith<$Res> {
  factory $CommonSearchModelResponseCopyWith(
    CommonSearchModelResponse value,
    $Res Function(CommonSearchModelResponse) then,
  ) = _$CommonSearchModelResponseCopyWithImpl<$Res, CommonSearchModelResponse>;
  @useResult
  $Res call({
    int? id,
    String? name,
    String? image,
    String? price,
    String? type,
  });
}

/// @nodoc
class _$CommonSearchModelResponseCopyWithImpl<
  $Res,
  $Val extends CommonSearchModelResponse
>
    implements $CommonSearchModelResponseCopyWith<$Res> {
  _$CommonSearchModelResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommonSearchModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? price = freezed,
    Object? type = freezed,
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
            price: freezed == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as String?,
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CommonSearchModelResponseImplCopyWith<$Res>
    implements $CommonSearchModelResponseCopyWith<$Res> {
  factory _$$CommonSearchModelResponseImplCopyWith(
    _$CommonSearchModelResponseImpl value,
    $Res Function(_$CommonSearchModelResponseImpl) then,
  ) = __$$CommonSearchModelResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    String? name,
    String? image,
    String? price,
    String? type,
  });
}

/// @nodoc
class __$$CommonSearchModelResponseImplCopyWithImpl<$Res>
    extends
        _$CommonSearchModelResponseCopyWithImpl<
          $Res,
          _$CommonSearchModelResponseImpl
        >
    implements _$$CommonSearchModelResponseImplCopyWith<$Res> {
  __$$CommonSearchModelResponseImplCopyWithImpl(
    _$CommonSearchModelResponseImpl _value,
    $Res Function(_$CommonSearchModelResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CommonSearchModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? price = freezed,
    Object? type = freezed,
  }) {
    return _then(
      _$CommonSearchModelResponseImpl(
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
        price: freezed == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as String?,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CommonSearchModelResponseImpl implements _CommonSearchModelResponse {
  const _$CommonSearchModelResponseImpl({
    this.id,
    this.name,
    this.image,
    this.price,
    this.type,
  });

  factory _$CommonSearchModelResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommonSearchModelResponseImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? image;
  @override
  final String? price;
  @override
  final String? type;

  @override
  String toString() {
    return 'CommonSearchModelResponse(id: $id, name: $name, image: $image, price: $price, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommonSearchModelResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, image, price, type);

  /// Create a copy of CommonSearchModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommonSearchModelResponseImplCopyWith<_$CommonSearchModelResponseImpl>
  get copyWith =>
      __$$CommonSearchModelResponseImplCopyWithImpl<
        _$CommonSearchModelResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommonSearchModelResponseImplToJson(this);
  }
}

abstract class _CommonSearchModelResponse implements CommonSearchModelResponse {
  const factory _CommonSearchModelResponse({
    final int? id,
    final String? name,
    final String? image,
    final String? price,
    final String? type,
  }) = _$CommonSearchModelResponseImpl;

  factory _CommonSearchModelResponse.fromJson(Map<String, dynamic> json) =
      _$CommonSearchModelResponseImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get image;
  @override
  String? get price;
  @override
  String? get type;

  /// Create a copy of CommonSearchModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommonSearchModelResponseImplCopyWith<_$CommonSearchModelResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
