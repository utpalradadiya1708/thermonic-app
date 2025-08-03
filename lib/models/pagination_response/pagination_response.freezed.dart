// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PaginationResponse<T> _$PaginationResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object?) fromJsonT,
) {
  return _PaginationResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$PaginationResponse<T> {
  @JsonKey(name: "total_pages")
  int get totalPages => throw _privateConstructorUsedError;
  @JsonKey(name: "is_ordered")
  bool? get isOrdered => throw _privateConstructorUsedError;
  @JsonKey(name: "order_id")
  int? get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: "subject_name")
  String? get subjectName => throw _privateConstructorUsedError;
  @JsonKey(name: "grade_name")
  String? get gradeName => throw _privateConstructorUsedError;
  @JsonKey(name: "stream_name")
  String? get streamName => throw _privateConstructorUsedError;
  TrainerModelResponse? get trainer => throw _privateConstructorUsedError;
  String? get price => throw _privateConstructorUsedError;
  List<T> get results => throw _privateConstructorUsedError;

  /// Serializes this PaginationResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of PaginationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginationResponseCopyWith<T, PaginationResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationResponseCopyWith<T, $Res> {
  factory $PaginationResponseCopyWith(
    PaginationResponse<T> value,
    $Res Function(PaginationResponse<T>) then,
  ) = _$PaginationResponseCopyWithImpl<T, $Res, PaginationResponse<T>>;
  @useResult
  $Res call({
    @JsonKey(name: "total_pages") int totalPages,
    @JsonKey(name: "is_ordered") bool? isOrdered,
    @JsonKey(name: "order_id") int? orderId,
    @JsonKey(name: "subject_name") String? subjectName,
    @JsonKey(name: "grade_name") String? gradeName,
    @JsonKey(name: "stream_name") String? streamName,
    TrainerModelResponse? trainer,
    String? price,
    List<T> results,
  });

  $TrainerModelResponseCopyWith<$Res>? get trainer;
}

/// @nodoc
class _$PaginationResponseCopyWithImpl<
  T,
  $Res,
  $Val extends PaginationResponse<T>
>
    implements $PaginationResponseCopyWith<T, $Res> {
  _$PaginationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPages = null,
    Object? isOrdered = freezed,
    Object? orderId = freezed,
    Object? subjectName = freezed,
    Object? gradeName = freezed,
    Object? streamName = freezed,
    Object? trainer = freezed,
    Object? price = freezed,
    Object? results = null,
  }) {
    return _then(
      _value.copyWith(
            totalPages: null == totalPages
                ? _value.totalPages
                : totalPages // ignore: cast_nullable_to_non_nullable
                      as int,
            isOrdered: freezed == isOrdered
                ? _value.isOrdered
                : isOrdered // ignore: cast_nullable_to_non_nullable
                      as bool?,
            orderId: freezed == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                      as int?,
            subjectName: freezed == subjectName
                ? _value.subjectName
                : subjectName // ignore: cast_nullable_to_non_nullable
                      as String?,
            gradeName: freezed == gradeName
                ? _value.gradeName
                : gradeName // ignore: cast_nullable_to_non_nullable
                      as String?,
            streamName: freezed == streamName
                ? _value.streamName
                : streamName // ignore: cast_nullable_to_non_nullable
                      as String?,
            trainer: freezed == trainer
                ? _value.trainer
                : trainer // ignore: cast_nullable_to_non_nullable
                      as TrainerModelResponse?,
            price: freezed == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as String?,
            results: null == results
                ? _value.results
                : results // ignore: cast_nullable_to_non_nullable
                      as List<T>,
          )
          as $Val,
    );
  }

  /// Create a copy of PaginationResponse
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
}

/// @nodoc
abstract class _$$PaginationResponseImplCopyWith<T, $Res>
    implements $PaginationResponseCopyWith<T, $Res> {
  factory _$$PaginationResponseImplCopyWith(
    _$PaginationResponseImpl<T> value,
    $Res Function(_$PaginationResponseImpl<T>) then,
  ) = __$$PaginationResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "total_pages") int totalPages,
    @JsonKey(name: "is_ordered") bool? isOrdered,
    @JsonKey(name: "order_id") int? orderId,
    @JsonKey(name: "subject_name") String? subjectName,
    @JsonKey(name: "grade_name") String? gradeName,
    @JsonKey(name: "stream_name") String? streamName,
    TrainerModelResponse? trainer,
    String? price,
    List<T> results,
  });

  @override
  $TrainerModelResponseCopyWith<$Res>? get trainer;
}

/// @nodoc
class __$$PaginationResponseImplCopyWithImpl<T, $Res>
    extends
        _$PaginationResponseCopyWithImpl<T, $Res, _$PaginationResponseImpl<T>>
    implements _$$PaginationResponseImplCopyWith<T, $Res> {
  __$$PaginationResponseImplCopyWithImpl(
    _$PaginationResponseImpl<T> _value,
    $Res Function(_$PaginationResponseImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of PaginationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPages = null,
    Object? isOrdered = freezed,
    Object? orderId = freezed,
    Object? subjectName = freezed,
    Object? gradeName = freezed,
    Object? streamName = freezed,
    Object? trainer = freezed,
    Object? price = freezed,
    Object? results = null,
  }) {
    return _then(
      _$PaginationResponseImpl<T>(
        totalPages: null == totalPages
            ? _value.totalPages
            : totalPages // ignore: cast_nullable_to_non_nullable
                  as int,
        isOrdered: freezed == isOrdered
            ? _value.isOrdered
            : isOrdered // ignore: cast_nullable_to_non_nullable
                  as bool?,
        orderId: freezed == orderId
            ? _value.orderId
            : orderId // ignore: cast_nullable_to_non_nullable
                  as int?,
        subjectName: freezed == subjectName
            ? _value.subjectName
            : subjectName // ignore: cast_nullable_to_non_nullable
                  as String?,
        gradeName: freezed == gradeName
            ? _value.gradeName
            : gradeName // ignore: cast_nullable_to_non_nullable
                  as String?,
        streamName: freezed == streamName
            ? _value.streamName
            : streamName // ignore: cast_nullable_to_non_nullable
                  as String?,
        trainer: freezed == trainer
            ? _value.trainer
            : trainer // ignore: cast_nullable_to_non_nullable
                  as TrainerModelResponse?,
        price: freezed == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as String?,
        results: null == results
            ? _value._results
            : results // ignore: cast_nullable_to_non_nullable
                  as List<T>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$PaginationResponseImpl<T> implements _PaginationResponse<T> {
  _$PaginationResponseImpl({
    @JsonKey(name: "total_pages") required this.totalPages,
    @JsonKey(name: "is_ordered") this.isOrdered,
    @JsonKey(name: "order_id") this.orderId,
    @JsonKey(name: "subject_name") this.subjectName,
    @JsonKey(name: "grade_name") this.gradeName,
    @JsonKey(name: "stream_name") this.streamName,
    this.trainer,
    this.price,
    required final List<T> results,
  }) : _results = results;

  factory _$PaginationResponseImpl.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$$PaginationResponseImplFromJson(json, fromJsonT);

  @override
  @JsonKey(name: "total_pages")
  final int totalPages;
  @override
  @JsonKey(name: "is_ordered")
  final bool? isOrdered;
  @override
  @JsonKey(name: "order_id")
  final int? orderId;
  @override
  @JsonKey(name: "subject_name")
  final String? subjectName;
  @override
  @JsonKey(name: "grade_name")
  final String? gradeName;
  @override
  @JsonKey(name: "stream_name")
  final String? streamName;
  @override
  final TrainerModelResponse? trainer;
  @override
  final String? price;
  final List<T> _results;
  @override
  List<T> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'PaginationResponse<$T>(totalPages: $totalPages, isOrdered: $isOrdered, orderId: $orderId, subjectName: $subjectName, gradeName: $gradeName, streamName: $streamName, trainer: $trainer, price: $price, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationResponseImpl<T> &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.isOrdered, isOrdered) ||
                other.isOrdered == isOrdered) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.subjectName, subjectName) ||
                other.subjectName == subjectName) &&
            (identical(other.gradeName, gradeName) ||
                other.gradeName == gradeName) &&
            (identical(other.streamName, streamName) ||
                other.streamName == streamName) &&
            (identical(other.trainer, trainer) || other.trainer == trainer) &&
            (identical(other.price, price) || other.price == price) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalPages,
    isOrdered,
    orderId,
    subjectName,
    gradeName,
    streamName,
    trainer,
    price,
    const DeepCollectionEquality().hash(_results),
  );

  /// Create a copy of PaginationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationResponseImplCopyWith<T, _$PaginationResponseImpl<T>>
  get copyWith =>
      __$$PaginationResponseImplCopyWithImpl<T, _$PaginationResponseImpl<T>>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$PaginationResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class _PaginationResponse<T> implements PaginationResponse<T> {
  factory _PaginationResponse({
    @JsonKey(name: "total_pages") required final int totalPages,
    @JsonKey(name: "is_ordered") final bool? isOrdered,
    @JsonKey(name: "order_id") final int? orderId,
    @JsonKey(name: "subject_name") final String? subjectName,
    @JsonKey(name: "grade_name") final String? gradeName,
    @JsonKey(name: "stream_name") final String? streamName,
    final TrainerModelResponse? trainer,
    final String? price,
    required final List<T> results,
  }) = _$PaginationResponseImpl<T>;

  factory _PaginationResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) = _$PaginationResponseImpl<T>.fromJson;

  @override
  @JsonKey(name: "total_pages")
  int get totalPages;
  @override
  @JsonKey(name: "is_ordered")
  bool? get isOrdered;
  @override
  @JsonKey(name: "order_id")
  int? get orderId;
  @override
  @JsonKey(name: "subject_name")
  String? get subjectName;
  @override
  @JsonKey(name: "grade_name")
  String? get gradeName;
  @override
  @JsonKey(name: "stream_name")
  String? get streamName;
  @override
  TrainerModelResponse? get trainer;
  @override
  String? get price;
  @override
  List<T> get results;

  /// Create a copy of PaginationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationResponseImplCopyWith<T, _$PaginationResponseImpl<T>>
  get copyWith => throw _privateConstructorUsedError;
}
