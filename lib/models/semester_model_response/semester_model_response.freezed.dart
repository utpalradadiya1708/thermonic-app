// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'semester_model_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SemesterModelResponse _$SemesterModelResponseFromJson(
  Map<String, dynamic> json,
) {
  return _SemesterModelResponse.fromJson(json);
}

/// @nodoc
mixin _$SemesterModelResponse {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_ordered')
  bool? get isOrdered => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_id')
  int? get orderId => throw _privateConstructorUsedError;
  List<ChapterModelResponse>? get chapters =>
      throw _privateConstructorUsedError;

  /// Serializes this SemesterModelResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SemesterModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SemesterModelResponseCopyWith<SemesterModelResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SemesterModelResponseCopyWith<$Res> {
  factory $SemesterModelResponseCopyWith(
    SemesterModelResponse value,
    $Res Function(SemesterModelResponse) then,
  ) = _$SemesterModelResponseCopyWithImpl<$Res, SemesterModelResponse>;
  @useResult
  $Res call({
    int? id,
    String? name,
    String? price,
    @JsonKey(name: 'is_ordered') bool? isOrdered,
    @JsonKey(name: 'order_id') int? orderId,
    List<ChapterModelResponse>? chapters,
  });
}

/// @nodoc
class _$SemesterModelResponseCopyWithImpl<
  $Res,
  $Val extends SemesterModelResponse
>
    implements $SemesterModelResponseCopyWith<$Res> {
  _$SemesterModelResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SemesterModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? isOrdered = freezed,
    Object? orderId = freezed,
    Object? chapters = freezed,
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
            price: freezed == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as String?,
            isOrdered: freezed == isOrdered
                ? _value.isOrdered
                : isOrdered // ignore: cast_nullable_to_non_nullable
                      as bool?,
            orderId: freezed == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                      as int?,
            chapters: freezed == chapters
                ? _value.chapters
                : chapters // ignore: cast_nullable_to_non_nullable
                      as List<ChapterModelResponse>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SemesterModelResponseImplCopyWith<$Res>
    implements $SemesterModelResponseCopyWith<$Res> {
  factory _$$SemesterModelResponseImplCopyWith(
    _$SemesterModelResponseImpl value,
    $Res Function(_$SemesterModelResponseImpl) then,
  ) = __$$SemesterModelResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    String? name,
    String? price,
    @JsonKey(name: 'is_ordered') bool? isOrdered,
    @JsonKey(name: 'order_id') int? orderId,
    List<ChapterModelResponse>? chapters,
  });
}

/// @nodoc
class __$$SemesterModelResponseImplCopyWithImpl<$Res>
    extends
        _$SemesterModelResponseCopyWithImpl<$Res, _$SemesterModelResponseImpl>
    implements _$$SemesterModelResponseImplCopyWith<$Res> {
  __$$SemesterModelResponseImplCopyWithImpl(
    _$SemesterModelResponseImpl _value,
    $Res Function(_$SemesterModelResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SemesterModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? isOrdered = freezed,
    Object? orderId = freezed,
    Object? chapters = freezed,
  }) {
    return _then(
      _$SemesterModelResponseImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        price: freezed == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as String?,
        isOrdered: freezed == isOrdered
            ? _value.isOrdered
            : isOrdered // ignore: cast_nullable_to_non_nullable
                  as bool?,
        orderId: freezed == orderId
            ? _value.orderId
            : orderId // ignore: cast_nullable_to_non_nullable
                  as int?,
        chapters: freezed == chapters
            ? _value._chapters
            : chapters // ignore: cast_nullable_to_non_nullable
                  as List<ChapterModelResponse>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SemesterModelResponseImpl implements _SemesterModelResponse {
  const _$SemesterModelResponseImpl({
    this.id,
    this.name,
    this.price,
    @JsonKey(name: 'is_ordered') this.isOrdered,
    @JsonKey(name: 'order_id') this.orderId,
    final List<ChapterModelResponse>? chapters,
  }) : _chapters = chapters;

  factory _$SemesterModelResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SemesterModelResponseImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? price;
  @override
  @JsonKey(name: 'is_ordered')
  final bool? isOrdered;
  @override
  @JsonKey(name: 'order_id')
  final int? orderId;
  final List<ChapterModelResponse>? _chapters;
  @override
  List<ChapterModelResponse>? get chapters {
    final value = _chapters;
    if (value == null) return null;
    if (_chapters is EqualUnmodifiableListView) return _chapters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SemesterModelResponse(id: $id, name: $name, price: $price, isOrdered: $isOrdered, orderId: $orderId, chapters: $chapters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SemesterModelResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.isOrdered, isOrdered) ||
                other.isOrdered == isOrdered) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            const DeepCollectionEquality().equals(other._chapters, _chapters));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    price,
    isOrdered,
    orderId,
    const DeepCollectionEquality().hash(_chapters),
  );

  /// Create a copy of SemesterModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SemesterModelResponseImplCopyWith<_$SemesterModelResponseImpl>
  get copyWith =>
      __$$SemesterModelResponseImplCopyWithImpl<_$SemesterModelResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SemesterModelResponseImplToJson(this);
  }
}

abstract class _SemesterModelResponse implements SemesterModelResponse {
  const factory _SemesterModelResponse({
    final int? id,
    final String? name,
    final String? price,
    @JsonKey(name: 'is_ordered') final bool? isOrdered,
    @JsonKey(name: 'order_id') final int? orderId,
    final List<ChapterModelResponse>? chapters,
  }) = _$SemesterModelResponseImpl;

  factory _SemesterModelResponse.fromJson(Map<String, dynamic> json) =
      _$SemesterModelResponseImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get price;
  @override
  @JsonKey(name: 'is_ordered')
  bool? get isOrdered;
  @override
  @JsonKey(name: 'order_id')
  int? get orderId;
  @override
  List<ChapterModelResponse>? get chapters;

  /// Create a copy of SemesterModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SemesterModelResponseImplCopyWith<_$SemesterModelResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
