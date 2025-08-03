// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OrderModelResponse _$OrderModelResponseFromJson(Map<String, dynamic> json) {
  return _OrderModelResponse.fromJson(json);
}

/// @nodoc
mixin _$OrderModelResponse {
  int? get id => throw _privateConstructorUsedError;
  String? get total => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'expiry_days_remaining')
  int? get expiryDaysRemaining => throw _privateConstructorUsedError;
  @JsonKey(name: 'subject_id')
  int? get subjectId => throw _privateConstructorUsedError;
  @JsonKey(name: 'grade_id')
  int? get gradeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'stream_id')
  int? get streamId => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_expired')
  bool? get isExpired => throw _privateConstructorUsedError;
  @JsonKey(name: 'grade_name')
  String? get gradeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'stream_name')
  String? get streamName => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_date')
  String? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'expiry_date')
  String? get expiryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'semester_name')
  String? get semesterName => throw _privateConstructorUsedError;
  @JsonKey(name: 'exam_attempted')
  bool? get examAttempted => throw _privateConstructorUsedError;

  /// Serializes this OrderModelResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderModelResponseCopyWith<OrderModelResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelResponseCopyWith<$Res> {
  factory $OrderModelResponseCopyWith(
    OrderModelResponse value,
    $Res Function(OrderModelResponse) then,
  ) = _$OrderModelResponseCopyWithImpl<$Res, OrderModelResponse>;
  @useResult
  $Res call({
    int? id,
    String? total,
    String? name,
    String? image,
    String? type,
    @JsonKey(name: 'expiry_days_remaining') int? expiryDaysRemaining,
    @JsonKey(name: 'subject_id') int? subjectId,
    @JsonKey(name: 'grade_id') int? gradeId,
    @JsonKey(name: 'stream_id') int? streamId,
    @JsonKey(name: 'is_expired') bool? isExpired,
    @JsonKey(name: 'grade_name') String? gradeName,
    @JsonKey(name: 'stream_name') String? streamName,
    @JsonKey(name: 'created_date') String? createdDate,
    @JsonKey(name: 'expiry_date') String? expiryDate,
    @JsonKey(name: 'semester_name') String? semesterName,
    @JsonKey(name: 'exam_attempted') bool? examAttempted,
  });
}

/// @nodoc
class _$OrderModelResponseCopyWithImpl<$Res, $Val extends OrderModelResponse>
    implements $OrderModelResponseCopyWith<$Res> {
  _$OrderModelResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? total = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? type = freezed,
    Object? expiryDaysRemaining = freezed,
    Object? subjectId = freezed,
    Object? gradeId = freezed,
    Object? streamId = freezed,
    Object? isExpired = freezed,
    Object? gradeName = freezed,
    Object? streamName = freezed,
    Object? createdDate = freezed,
    Object? expiryDate = freezed,
    Object? semesterName = freezed,
    Object? examAttempted = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            total: freezed == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as String?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            image: freezed == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String?,
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String?,
            expiryDaysRemaining: freezed == expiryDaysRemaining
                ? _value.expiryDaysRemaining
                : expiryDaysRemaining // ignore: cast_nullable_to_non_nullable
                      as int?,
            subjectId: freezed == subjectId
                ? _value.subjectId
                : subjectId // ignore: cast_nullable_to_non_nullable
                      as int?,
            gradeId: freezed == gradeId
                ? _value.gradeId
                : gradeId // ignore: cast_nullable_to_non_nullable
                      as int?,
            streamId: freezed == streamId
                ? _value.streamId
                : streamId // ignore: cast_nullable_to_non_nullable
                      as int?,
            isExpired: freezed == isExpired
                ? _value.isExpired
                : isExpired // ignore: cast_nullable_to_non_nullable
                      as bool?,
            gradeName: freezed == gradeName
                ? _value.gradeName
                : gradeName // ignore: cast_nullable_to_non_nullable
                      as String?,
            streamName: freezed == streamName
                ? _value.streamName
                : streamName // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdDate: freezed == createdDate
                ? _value.createdDate
                : createdDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            expiryDate: freezed == expiryDate
                ? _value.expiryDate
                : expiryDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            semesterName: freezed == semesterName
                ? _value.semesterName
                : semesterName // ignore: cast_nullable_to_non_nullable
                      as String?,
            examAttempted: freezed == examAttempted
                ? _value.examAttempted
                : examAttempted // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrderModelResponseImplCopyWith<$Res>
    implements $OrderModelResponseCopyWith<$Res> {
  factory _$$OrderModelResponseImplCopyWith(
    _$OrderModelResponseImpl value,
    $Res Function(_$OrderModelResponseImpl) then,
  ) = __$$OrderModelResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    String? total,
    String? name,
    String? image,
    String? type,
    @JsonKey(name: 'expiry_days_remaining') int? expiryDaysRemaining,
    @JsonKey(name: 'subject_id') int? subjectId,
    @JsonKey(name: 'grade_id') int? gradeId,
    @JsonKey(name: 'stream_id') int? streamId,
    @JsonKey(name: 'is_expired') bool? isExpired,
    @JsonKey(name: 'grade_name') String? gradeName,
    @JsonKey(name: 'stream_name') String? streamName,
    @JsonKey(name: 'created_date') String? createdDate,
    @JsonKey(name: 'expiry_date') String? expiryDate,
    @JsonKey(name: 'semester_name') String? semesterName,
    @JsonKey(name: 'exam_attempted') bool? examAttempted,
  });
}

/// @nodoc
class __$$OrderModelResponseImplCopyWithImpl<$Res>
    extends _$OrderModelResponseCopyWithImpl<$Res, _$OrderModelResponseImpl>
    implements _$$OrderModelResponseImplCopyWith<$Res> {
  __$$OrderModelResponseImplCopyWithImpl(
    _$OrderModelResponseImpl _value,
    $Res Function(_$OrderModelResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? total = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? type = freezed,
    Object? expiryDaysRemaining = freezed,
    Object? subjectId = freezed,
    Object? gradeId = freezed,
    Object? streamId = freezed,
    Object? isExpired = freezed,
    Object? gradeName = freezed,
    Object? streamName = freezed,
    Object? createdDate = freezed,
    Object? expiryDate = freezed,
    Object? semesterName = freezed,
    Object? examAttempted = freezed,
  }) {
    return _then(
      _$OrderModelResponseImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        total: freezed == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        image: freezed == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String?,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String?,
        expiryDaysRemaining: freezed == expiryDaysRemaining
            ? _value.expiryDaysRemaining
            : expiryDaysRemaining // ignore: cast_nullable_to_non_nullable
                  as int?,
        subjectId: freezed == subjectId
            ? _value.subjectId
            : subjectId // ignore: cast_nullable_to_non_nullable
                  as int?,
        gradeId: freezed == gradeId
            ? _value.gradeId
            : gradeId // ignore: cast_nullable_to_non_nullable
                  as int?,
        streamId: freezed == streamId
            ? _value.streamId
            : streamId // ignore: cast_nullable_to_non_nullable
                  as int?,
        isExpired: freezed == isExpired
            ? _value.isExpired
            : isExpired // ignore: cast_nullable_to_non_nullable
                  as bool?,
        gradeName: freezed == gradeName
            ? _value.gradeName
            : gradeName // ignore: cast_nullable_to_non_nullable
                  as String?,
        streamName: freezed == streamName
            ? _value.streamName
            : streamName // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdDate: freezed == createdDate
            ? _value.createdDate
            : createdDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        expiryDate: freezed == expiryDate
            ? _value.expiryDate
            : expiryDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        semesterName: freezed == semesterName
            ? _value.semesterName
            : semesterName // ignore: cast_nullable_to_non_nullable
                  as String?,
        examAttempted: freezed == examAttempted
            ? _value.examAttempted
            : examAttempted // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderModelResponseImpl extends _OrderModelResponse {
  const _$OrderModelResponseImpl({
    this.id,
    this.total,
    this.name,
    this.image,
    this.type,
    @JsonKey(name: 'expiry_days_remaining') this.expiryDaysRemaining,
    @JsonKey(name: 'subject_id') this.subjectId,
    @JsonKey(name: 'grade_id') this.gradeId,
    @JsonKey(name: 'stream_id') this.streamId,
    @JsonKey(name: 'is_expired') this.isExpired,
    @JsonKey(name: 'grade_name') this.gradeName,
    @JsonKey(name: 'stream_name') this.streamName,
    @JsonKey(name: 'created_date') this.createdDate,
    @JsonKey(name: 'expiry_date') this.expiryDate,
    @JsonKey(name: 'semester_name') this.semesterName,
    @JsonKey(name: 'exam_attempted') this.examAttempted,
  }) : super._();

  factory _$OrderModelResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderModelResponseImplFromJson(json);

  @override
  final int? id;
  @override
  final String? total;
  @override
  final String? name;
  @override
  final String? image;
  @override
  final String? type;
  @override
  @JsonKey(name: 'expiry_days_remaining')
  final int? expiryDaysRemaining;
  @override
  @JsonKey(name: 'subject_id')
  final int? subjectId;
  @override
  @JsonKey(name: 'grade_id')
  final int? gradeId;
  @override
  @JsonKey(name: 'stream_id')
  final int? streamId;
  @override
  @JsonKey(name: 'is_expired')
  final bool? isExpired;
  @override
  @JsonKey(name: 'grade_name')
  final String? gradeName;
  @override
  @JsonKey(name: 'stream_name')
  final String? streamName;
  @override
  @JsonKey(name: 'created_date')
  final String? createdDate;
  @override
  @JsonKey(name: 'expiry_date')
  final String? expiryDate;
  @override
  @JsonKey(name: 'semester_name')
  final String? semesterName;
  @override
  @JsonKey(name: 'exam_attempted')
  final bool? examAttempted;

  @override
  String toString() {
    return 'OrderModelResponse(id: $id, total: $total, name: $name, image: $image, type: $type, expiryDaysRemaining: $expiryDaysRemaining, subjectId: $subjectId, gradeId: $gradeId, streamId: $streamId, isExpired: $isExpired, gradeName: $gradeName, streamName: $streamName, createdDate: $createdDate, expiryDate: $expiryDate, semesterName: $semesterName, examAttempted: $examAttempted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderModelResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.expiryDaysRemaining, expiryDaysRemaining) ||
                other.expiryDaysRemaining == expiryDaysRemaining) &&
            (identical(other.subjectId, subjectId) ||
                other.subjectId == subjectId) &&
            (identical(other.gradeId, gradeId) || other.gradeId == gradeId) &&
            (identical(other.streamId, streamId) ||
                other.streamId == streamId) &&
            (identical(other.isExpired, isExpired) ||
                other.isExpired == isExpired) &&
            (identical(other.gradeName, gradeName) ||
                other.gradeName == gradeName) &&
            (identical(other.streamName, streamName) ||
                other.streamName == streamName) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.semesterName, semesterName) ||
                other.semesterName == semesterName) &&
            (identical(other.examAttempted, examAttempted) ||
                other.examAttempted == examAttempted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    total,
    name,
    image,
    type,
    expiryDaysRemaining,
    subjectId,
    gradeId,
    streamId,
    isExpired,
    gradeName,
    streamName,
    createdDate,
    expiryDate,
    semesterName,
    examAttempted,
  );

  /// Create a copy of OrderModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderModelResponseImplCopyWith<_$OrderModelResponseImpl> get copyWith =>
      __$$OrderModelResponseImplCopyWithImpl<_$OrderModelResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderModelResponseImplToJson(this);
  }
}

abstract class _OrderModelResponse extends OrderModelResponse {
  const factory _OrderModelResponse({
    final int? id,
    final String? total,
    final String? name,
    final String? image,
    final String? type,
    @JsonKey(name: 'expiry_days_remaining') final int? expiryDaysRemaining,
    @JsonKey(name: 'subject_id') final int? subjectId,
    @JsonKey(name: 'grade_id') final int? gradeId,
    @JsonKey(name: 'stream_id') final int? streamId,
    @JsonKey(name: 'is_expired') final bool? isExpired,
    @JsonKey(name: 'grade_name') final String? gradeName,
    @JsonKey(name: 'stream_name') final String? streamName,
    @JsonKey(name: 'created_date') final String? createdDate,
    @JsonKey(name: 'expiry_date') final String? expiryDate,
    @JsonKey(name: 'semester_name') final String? semesterName,
    @JsonKey(name: 'exam_attempted') final bool? examAttempted,
  }) = _$OrderModelResponseImpl;
  const _OrderModelResponse._() : super._();

  factory _OrderModelResponse.fromJson(Map<String, dynamic> json) =
      _$OrderModelResponseImpl.fromJson;

  @override
  int? get id;
  @override
  String? get total;
  @override
  String? get name;
  @override
  String? get image;
  @override
  String? get type;
  @override
  @JsonKey(name: 'expiry_days_remaining')
  int? get expiryDaysRemaining;
  @override
  @JsonKey(name: 'subject_id')
  int? get subjectId;
  @override
  @JsonKey(name: 'grade_id')
  int? get gradeId;
  @override
  @JsonKey(name: 'stream_id')
  int? get streamId;
  @override
  @JsonKey(name: 'is_expired')
  bool? get isExpired;
  @override
  @JsonKey(name: 'grade_name')
  String? get gradeName;
  @override
  @JsonKey(name: 'stream_name')
  String? get streamName;
  @override
  @JsonKey(name: 'created_date')
  String? get createdDate;
  @override
  @JsonKey(name: 'expiry_date')
  String? get expiryDate;
  @override
  @JsonKey(name: 'semester_name')
  String? get semesterName;
  @override
  @JsonKey(name: 'exam_attempted')
  bool? get examAttempted;

  /// Create a copy of OrderModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderModelResponseImplCopyWith<_$OrderModelResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
