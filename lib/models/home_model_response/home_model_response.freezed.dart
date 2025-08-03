// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_model_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

HomeModelResponse _$HomeModelResponseFromJson(Map<String, dynamic> json) {
  return _HomeModelResponse.fromJson(json);
}

/// @nodoc
mixin _$HomeModelResponse {
  List<SubjectModelResponse>? get subjects =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "subjects_view_all")
  bool? get subjectsViewAll => throw _privateConstructorUsedError;
  List<ExamModelResponse>? get exams => throw _privateConstructorUsedError;
  @JsonKey(name: "exam_view_all")
  bool? get examViewAll => throw _privateConstructorUsedError;
  @JsonKey(name: "notification_count")
  int? get notificationCount => throw _privateConstructorUsedError;
  List<GradeModel>? get grades => throw _privateConstructorUsedError;

  /// Serializes this HomeModelResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HomeModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeModelResponseCopyWith<HomeModelResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeModelResponseCopyWith<$Res> {
  factory $HomeModelResponseCopyWith(
    HomeModelResponse value,
    $Res Function(HomeModelResponse) then,
  ) = _$HomeModelResponseCopyWithImpl<$Res, HomeModelResponse>;
  @useResult
  $Res call({
    List<SubjectModelResponse>? subjects,
    @JsonKey(name: "subjects_view_all") bool? subjectsViewAll,
    List<ExamModelResponse>? exams,
    @JsonKey(name: "exam_view_all") bool? examViewAll,
    @JsonKey(name: "notification_count") int? notificationCount,
    List<GradeModel>? grades,
  });
}

/// @nodoc
class _$HomeModelResponseCopyWithImpl<$Res, $Val extends HomeModelResponse>
    implements $HomeModelResponseCopyWith<$Res> {
  _$HomeModelResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjects = freezed,
    Object? subjectsViewAll = freezed,
    Object? exams = freezed,
    Object? examViewAll = freezed,
    Object? notificationCount = freezed,
    Object? grades = freezed,
  }) {
    return _then(
      _value.copyWith(
            subjects: freezed == subjects
                ? _value.subjects
                : subjects // ignore: cast_nullable_to_non_nullable
                      as List<SubjectModelResponse>?,
            subjectsViewAll: freezed == subjectsViewAll
                ? _value.subjectsViewAll
                : subjectsViewAll // ignore: cast_nullable_to_non_nullable
                      as bool?,
            exams: freezed == exams
                ? _value.exams
                : exams // ignore: cast_nullable_to_non_nullable
                      as List<ExamModelResponse>?,
            examViewAll: freezed == examViewAll
                ? _value.examViewAll
                : examViewAll // ignore: cast_nullable_to_non_nullable
                      as bool?,
            notificationCount: freezed == notificationCount
                ? _value.notificationCount
                : notificationCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            grades: freezed == grades
                ? _value.grades
                : grades // ignore: cast_nullable_to_non_nullable
                      as List<GradeModel>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HomeModelResponseImplCopyWith<$Res>
    implements $HomeModelResponseCopyWith<$Res> {
  factory _$$HomeModelResponseImplCopyWith(
    _$HomeModelResponseImpl value,
    $Res Function(_$HomeModelResponseImpl) then,
  ) = __$$HomeModelResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<SubjectModelResponse>? subjects,
    @JsonKey(name: "subjects_view_all") bool? subjectsViewAll,
    List<ExamModelResponse>? exams,
    @JsonKey(name: "exam_view_all") bool? examViewAll,
    @JsonKey(name: "notification_count") int? notificationCount,
    List<GradeModel>? grades,
  });
}

/// @nodoc
class __$$HomeModelResponseImplCopyWithImpl<$Res>
    extends _$HomeModelResponseCopyWithImpl<$Res, _$HomeModelResponseImpl>
    implements _$$HomeModelResponseImplCopyWith<$Res> {
  __$$HomeModelResponseImplCopyWithImpl(
    _$HomeModelResponseImpl _value,
    $Res Function(_$HomeModelResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjects = freezed,
    Object? subjectsViewAll = freezed,
    Object? exams = freezed,
    Object? examViewAll = freezed,
    Object? notificationCount = freezed,
    Object? grades = freezed,
  }) {
    return _then(
      _$HomeModelResponseImpl(
        subjects: freezed == subjects
            ? _value._subjects
            : subjects // ignore: cast_nullable_to_non_nullable
                  as List<SubjectModelResponse>?,
        subjectsViewAll: freezed == subjectsViewAll
            ? _value.subjectsViewAll
            : subjectsViewAll // ignore: cast_nullable_to_non_nullable
                  as bool?,
        exams: freezed == exams
            ? _value._exams
            : exams // ignore: cast_nullable_to_non_nullable
                  as List<ExamModelResponse>?,
        examViewAll: freezed == examViewAll
            ? _value.examViewAll
            : examViewAll // ignore: cast_nullable_to_non_nullable
                  as bool?,
        notificationCount: freezed == notificationCount
            ? _value.notificationCount
            : notificationCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        grades: freezed == grades
            ? _value._grades
            : grades // ignore: cast_nullable_to_non_nullable
                  as List<GradeModel>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeModelResponseImpl implements _HomeModelResponse {
  const _$HomeModelResponseImpl({
    final List<SubjectModelResponse>? subjects,
    @JsonKey(name: "subjects_view_all") this.subjectsViewAll,
    final List<ExamModelResponse>? exams,
    @JsonKey(name: "exam_view_all") this.examViewAll,
    @JsonKey(name: "notification_count") this.notificationCount,
    final List<GradeModel>? grades,
  }) : _subjects = subjects,
       _exams = exams,
       _grades = grades;

  factory _$HomeModelResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeModelResponseImplFromJson(json);

  final List<SubjectModelResponse>? _subjects;
  @override
  List<SubjectModelResponse>? get subjects {
    final value = _subjects;
    if (value == null) return null;
    if (_subjects is EqualUnmodifiableListView) return _subjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "subjects_view_all")
  final bool? subjectsViewAll;
  final List<ExamModelResponse>? _exams;
  @override
  List<ExamModelResponse>? get exams {
    final value = _exams;
    if (value == null) return null;
    if (_exams is EqualUnmodifiableListView) return _exams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "exam_view_all")
  final bool? examViewAll;
  @override
  @JsonKey(name: "notification_count")
  final int? notificationCount;
  final List<GradeModel>? _grades;
  @override
  List<GradeModel>? get grades {
    final value = _grades;
    if (value == null) return null;
    if (_grades is EqualUnmodifiableListView) return _grades;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'HomeModelResponse(subjects: $subjects, subjectsViewAll: $subjectsViewAll, exams: $exams, examViewAll: $examViewAll, notificationCount: $notificationCount, grades: $grades)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeModelResponseImpl &&
            const DeepCollectionEquality().equals(other._subjects, _subjects) &&
            (identical(other.subjectsViewAll, subjectsViewAll) ||
                other.subjectsViewAll == subjectsViewAll) &&
            const DeepCollectionEquality().equals(other._exams, _exams) &&
            (identical(other.examViewAll, examViewAll) ||
                other.examViewAll == examViewAll) &&
            (identical(other.notificationCount, notificationCount) ||
                other.notificationCount == notificationCount) &&
            const DeepCollectionEquality().equals(other._grades, _grades));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_subjects),
    subjectsViewAll,
    const DeepCollectionEquality().hash(_exams),
    examViewAll,
    notificationCount,
    const DeepCollectionEquality().hash(_grades),
  );

  /// Create a copy of HomeModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeModelResponseImplCopyWith<_$HomeModelResponseImpl> get copyWith =>
      __$$HomeModelResponseImplCopyWithImpl<_$HomeModelResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeModelResponseImplToJson(this);
  }
}

abstract class _HomeModelResponse implements HomeModelResponse {
  const factory _HomeModelResponse({
    final List<SubjectModelResponse>? subjects,
    @JsonKey(name: "subjects_view_all") final bool? subjectsViewAll,
    final List<ExamModelResponse>? exams,
    @JsonKey(name: "exam_view_all") final bool? examViewAll,
    @JsonKey(name: "notification_count") final int? notificationCount,
    final List<GradeModel>? grades,
  }) = _$HomeModelResponseImpl;

  factory _HomeModelResponse.fromJson(Map<String, dynamic> json) =
      _$HomeModelResponseImpl.fromJson;

  @override
  List<SubjectModelResponse>? get subjects;
  @override
  @JsonKey(name: "subjects_view_all")
  bool? get subjectsViewAll;
  @override
  List<ExamModelResponse>? get exams;
  @override
  @JsonKey(name: "exam_view_all")
  bool? get examViewAll;
  @override
  @JsonKey(name: "notification_count")
  int? get notificationCount;
  @override
  List<GradeModel>? get grades;

  /// Create a copy of HomeModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeModelResponseImplCopyWith<_$HomeModelResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
