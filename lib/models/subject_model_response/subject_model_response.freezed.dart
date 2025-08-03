// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subject_model_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SubjectModelResponse _$SubjectModelResponseFromJson(Map<String, dynamic> json) {
  return _SubjectModelResponse.fromJson(json);
}

/// @nodoc
mixin _$SubjectModelResponse {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_ordered')
  bool? get isOrdered => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_id')
  int? get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'exam_attempted')
  bool? get examAttempted => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<SemesterModelResponse>? get semesters =>
      throw _privateConstructorUsedError;
  TrainerModelResponse? get trainer => throw _privateConstructorUsedError;
  @JsonKey(name: 'reviews')
  ReviewModelResponse? get reviewData => throw _privateConstructorUsedError;

  /// Serializes this SubjectModelResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubjectModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubjectModelResponseCopyWith<SubjectModelResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectModelResponseCopyWith<$Res> {
  factory $SubjectModelResponseCopyWith(
    SubjectModelResponse value,
    $Res Function(SubjectModelResponse) then,
  ) = _$SubjectModelResponseCopyWithImpl<$Res, SubjectModelResponse>;
  @useResult
  $Res call({
    int? id,
    String? name,
    String? image,
    String? price,
    @JsonKey(name: 'is_ordered') bool? isOrdered,
    @JsonKey(name: 'order_id') int? orderId,
    @JsonKey(name: 'exam_attempted') bool? examAttempted,
    String? description,
    List<SemesterModelResponse>? semesters,
    TrainerModelResponse? trainer,
    @JsonKey(name: 'reviews') ReviewModelResponse? reviewData,
  });

  $TrainerModelResponseCopyWith<$Res>? get trainer;
  $ReviewModelResponseCopyWith<$Res>? get reviewData;
}

/// @nodoc
class _$SubjectModelResponseCopyWithImpl<
  $Res,
  $Val extends SubjectModelResponse
>
    implements $SubjectModelResponseCopyWith<$Res> {
  _$SubjectModelResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubjectModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? price = freezed,
    Object? isOrdered = freezed,
    Object? orderId = freezed,
    Object? examAttempted = freezed,
    Object? description = freezed,
    Object? semesters = freezed,
    Object? trainer = freezed,
    Object? reviewData = freezed,
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
            isOrdered: freezed == isOrdered
                ? _value.isOrdered
                : isOrdered // ignore: cast_nullable_to_non_nullable
                      as bool?,
            orderId: freezed == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                      as int?,
            examAttempted: freezed == examAttempted
                ? _value.examAttempted
                : examAttempted // ignore: cast_nullable_to_non_nullable
                      as bool?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            semesters: freezed == semesters
                ? _value.semesters
                : semesters // ignore: cast_nullable_to_non_nullable
                      as List<SemesterModelResponse>?,
            trainer: freezed == trainer
                ? _value.trainer
                : trainer // ignore: cast_nullable_to_non_nullable
                      as TrainerModelResponse?,
            reviewData: freezed == reviewData
                ? _value.reviewData
                : reviewData // ignore: cast_nullable_to_non_nullable
                      as ReviewModelResponse?,
          )
          as $Val,
    );
  }

  /// Create a copy of SubjectModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TrainerModelResponseCopyWith<$Res>? get trainer {
    if (_value.trainer == null) {
      return null;
    }

    return $TrainerModelResponseCopyWith<$Res>(_value.trainer!, (value) {
      return _then(_value.copyWith(trainer: value) as $Val);
    });
  }

  /// Create a copy of SubjectModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReviewModelResponseCopyWith<$Res>? get reviewData {
    if (_value.reviewData == null) {
      return null;
    }

    return $ReviewModelResponseCopyWith<$Res>(_value.reviewData!, (value) {
      return _then(_value.copyWith(reviewData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SubjectModelResponseImplCopyWith<$Res>
    implements $SubjectModelResponseCopyWith<$Res> {
  factory _$$SubjectModelResponseImplCopyWith(
    _$SubjectModelResponseImpl value,
    $Res Function(_$SubjectModelResponseImpl) then,
  ) = __$$SubjectModelResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    String? name,
    String? image,
    String? price,
    @JsonKey(name: 'is_ordered') bool? isOrdered,
    @JsonKey(name: 'order_id') int? orderId,
    @JsonKey(name: 'exam_attempted') bool? examAttempted,
    String? description,
    List<SemesterModelResponse>? semesters,
    TrainerModelResponse? trainer,
    @JsonKey(name: 'reviews') ReviewModelResponse? reviewData,
  });

  @override
  $TrainerModelResponseCopyWith<$Res>? get trainer;
  @override
  $ReviewModelResponseCopyWith<$Res>? get reviewData;
}

/// @nodoc
class __$$SubjectModelResponseImplCopyWithImpl<$Res>
    extends _$SubjectModelResponseCopyWithImpl<$Res, _$SubjectModelResponseImpl>
    implements _$$SubjectModelResponseImplCopyWith<$Res> {
  __$$SubjectModelResponseImplCopyWithImpl(
    _$SubjectModelResponseImpl _value,
    $Res Function(_$SubjectModelResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SubjectModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? price = freezed,
    Object? isOrdered = freezed,
    Object? orderId = freezed,
    Object? examAttempted = freezed,
    Object? description = freezed,
    Object? semesters = freezed,
    Object? trainer = freezed,
    Object? reviewData = freezed,
  }) {
    return _then(
      _$SubjectModelResponseImpl(
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
        isOrdered: freezed == isOrdered
            ? _value.isOrdered
            : isOrdered // ignore: cast_nullable_to_non_nullable
                  as bool?,
        orderId: freezed == orderId
            ? _value.orderId
            : orderId // ignore: cast_nullable_to_non_nullable
                  as int?,
        examAttempted: freezed == examAttempted
            ? _value.examAttempted
            : examAttempted // ignore: cast_nullable_to_non_nullable
                  as bool?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        semesters: freezed == semesters
            ? _value._semesters
            : semesters // ignore: cast_nullable_to_non_nullable
                  as List<SemesterModelResponse>?,
        trainer: freezed == trainer
            ? _value.trainer
            : trainer // ignore: cast_nullable_to_non_nullable
                  as TrainerModelResponse?,
        reviewData: freezed == reviewData
            ? _value.reviewData
            : reviewData // ignore: cast_nullable_to_non_nullable
                  as ReviewModelResponse?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SubjectModelResponseImpl extends _SubjectModelResponse {
  const _$SubjectModelResponseImpl({
    this.id,
    this.name,
    this.image,
    this.price,
    @JsonKey(name: 'is_ordered') this.isOrdered,
    @JsonKey(name: 'order_id') this.orderId,
    @JsonKey(name: 'exam_attempted') this.examAttempted,
    this.description,
    final List<SemesterModelResponse>? semesters,
    this.trainer,
    @JsonKey(name: 'reviews') this.reviewData,
  }) : _semesters = semesters,
       super._();

  factory _$SubjectModelResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubjectModelResponseImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? image;
  @override
  final String? price;
  @override
  @JsonKey(name: 'is_ordered')
  final bool? isOrdered;
  @override
  @JsonKey(name: 'order_id')
  final int? orderId;
  @override
  @JsonKey(name: 'exam_attempted')
  final bool? examAttempted;
  @override
  final String? description;
  final List<SemesterModelResponse>? _semesters;
  @override
  List<SemesterModelResponse>? get semesters {
    final value = _semesters;
    if (value == null) return null;
    if (_semesters is EqualUnmodifiableListView) return _semesters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final TrainerModelResponse? trainer;
  @override
  @JsonKey(name: 'reviews')
  final ReviewModelResponse? reviewData;

  @override
  String toString() {
    return 'SubjectModelResponse(id: $id, name: $name, image: $image, price: $price, isOrdered: $isOrdered, orderId: $orderId, examAttempted: $examAttempted, description: $description, semesters: $semesters, trainer: $trainer, reviewData: $reviewData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubjectModelResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.isOrdered, isOrdered) ||
                other.isOrdered == isOrdered) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.examAttempted, examAttempted) ||
                other.examAttempted == examAttempted) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(
              other._semesters,
              _semesters,
            ) &&
            (identical(other.trainer, trainer) || other.trainer == trainer) &&
            (identical(other.reviewData, reviewData) ||
                other.reviewData == reviewData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    image,
    price,
    isOrdered,
    orderId,
    examAttempted,
    description,
    const DeepCollectionEquality().hash(_semesters),
    trainer,
    reviewData,
  );

  /// Create a copy of SubjectModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubjectModelResponseImplCopyWith<_$SubjectModelResponseImpl>
  get copyWith =>
      __$$SubjectModelResponseImplCopyWithImpl<_$SubjectModelResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SubjectModelResponseImplToJson(this);
  }
}

abstract class _SubjectModelResponse extends SubjectModelResponse {
  const factory _SubjectModelResponse({
    final int? id,
    final String? name,
    final String? image,
    final String? price,
    @JsonKey(name: 'is_ordered') final bool? isOrdered,
    @JsonKey(name: 'order_id') final int? orderId,
    @JsonKey(name: 'exam_attempted') final bool? examAttempted,
    final String? description,
    final List<SemesterModelResponse>? semesters,
    final TrainerModelResponse? trainer,
    @JsonKey(name: 'reviews') final ReviewModelResponse? reviewData,
  }) = _$SubjectModelResponseImpl;
  const _SubjectModelResponse._() : super._();

  factory _SubjectModelResponse.fromJson(Map<String, dynamic> json) =
      _$SubjectModelResponseImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get image;
  @override
  String? get price;
  @override
  @JsonKey(name: 'is_ordered')
  bool? get isOrdered;
  @override
  @JsonKey(name: 'order_id')
  int? get orderId;
  @override
  @JsonKey(name: 'exam_attempted')
  bool? get examAttempted;
  @override
  String? get description;
  @override
  List<SemesterModelResponse>? get semesters;
  @override
  TrainerModelResponse? get trainer;
  @override
  @JsonKey(name: 'reviews')
  ReviewModelResponse? get reviewData;

  /// Create a copy of SubjectModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubjectModelResponseImplCopyWith<_$SubjectModelResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
