// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chapter_model_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ChapterModelResponse _$ChapterModelResponseFromJson(Map<String, dynamic> json) {
  return _ChapterModelResponse.fromJson(json);
}

/// @nodoc
mixin _$ChapterModelResponse {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get rating => throw _privateConstructorUsedError;
  @JsonKey(name: 'review_count')
  String? get reviewCount => throw _privateConstructorUsedError;
  String? get price => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get progess => throw _privateConstructorUsedError;
  @JsonKey(name: 'pdf_url')
  String? get pdfUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_free')
  bool? get isFree => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_ordered')
  bool? get isOrdered => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_id')
  int? get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'semester_id')
  int? get semesterId => throw _privateConstructorUsedError;
  @JsonKey(name: 'exam_attempted')
  bool? get isExamAttempted => throw _privateConstructorUsedError;
  SubjectModelResponse? get subject => throw _privateConstructorUsedError;
  TrainerModelResponse? get trainer => throw _privateConstructorUsedError;
  GradeModel? get grade => throw _privateConstructorUsedError;
  StreamModel? get stream => throw _privateConstructorUsedError;
  @JsonKey(name: 'saved')
  bool? get saved => throw _privateConstructorUsedError;
  List<TopicModelResponse>? get topics => throw _privateConstructorUsedError;

  /// Serializes this ChapterModelResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChapterModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChapterModelResponseCopyWith<ChapterModelResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterModelResponseCopyWith<$Res> {
  factory $ChapterModelResponseCopyWith(
    ChapterModelResponse value,
    $Res Function(ChapterModelResponse) then,
  ) = _$ChapterModelResponseCopyWithImpl<$Res, ChapterModelResponse>;
  @useResult
  $Res call({
    int? id,
    String? name,
    String? rating,
    @JsonKey(name: 'review_count') String? reviewCount,
    String? price,
    String? description,
    int? progess,
    @JsonKey(name: 'pdf_url') String? pdfUrl,
    @JsonKey(name: 'is_free') bool? isFree,
    @JsonKey(name: 'is_ordered') bool? isOrdered,
    @JsonKey(name: 'order_id') int? orderId,
    @JsonKey(name: 'semester_id') int? semesterId,
    @JsonKey(name: 'exam_attempted') bool? isExamAttempted,
    SubjectModelResponse? subject,
    TrainerModelResponse? trainer,
    GradeModel? grade,
    StreamModel? stream,
    @JsonKey(name: 'saved') bool? saved,
    List<TopicModelResponse>? topics,
  });

  $SubjectModelResponseCopyWith<$Res>? get subject;
  $TrainerModelResponseCopyWith<$Res>? get trainer;
  $GradeModelCopyWith<$Res>? get grade;
  $StreamModelCopyWith<$Res>? get stream;
}

/// @nodoc
class _$ChapterModelResponseCopyWithImpl<
  $Res,
  $Val extends ChapterModelResponse
>
    implements $ChapterModelResponseCopyWith<$Res> {
  _$ChapterModelResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChapterModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? rating = freezed,
    Object? reviewCount = freezed,
    Object? price = freezed,
    Object? description = freezed,
    Object? progess = freezed,
    Object? pdfUrl = freezed,
    Object? isFree = freezed,
    Object? isOrdered = freezed,
    Object? orderId = freezed,
    Object? semesterId = freezed,
    Object? isExamAttempted = freezed,
    Object? subject = freezed,
    Object? trainer = freezed,
    Object? grade = freezed,
    Object? stream = freezed,
    Object? saved = freezed,
    Object? topics = freezed,
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
            rating: freezed == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as String?,
            reviewCount: freezed == reviewCount
                ? _value.reviewCount
                : reviewCount // ignore: cast_nullable_to_non_nullable
                      as String?,
            price: freezed == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            progess: freezed == progess
                ? _value.progess
                : progess // ignore: cast_nullable_to_non_nullable
                      as int?,
            pdfUrl: freezed == pdfUrl
                ? _value.pdfUrl
                : pdfUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            isFree: freezed == isFree
                ? _value.isFree
                : isFree // ignore: cast_nullable_to_non_nullable
                      as bool?,
            isOrdered: freezed == isOrdered
                ? _value.isOrdered
                : isOrdered // ignore: cast_nullable_to_non_nullable
                      as bool?,
            orderId: freezed == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                      as int?,
            semesterId: freezed == semesterId
                ? _value.semesterId
                : semesterId // ignore: cast_nullable_to_non_nullable
                      as int?,
            isExamAttempted: freezed == isExamAttempted
                ? _value.isExamAttempted
                : isExamAttempted // ignore: cast_nullable_to_non_nullable
                      as bool?,
            subject: freezed == subject
                ? _value.subject
                : subject // ignore: cast_nullable_to_non_nullable
                      as SubjectModelResponse?,
            trainer: freezed == trainer
                ? _value.trainer
                : trainer // ignore: cast_nullable_to_non_nullable
                      as TrainerModelResponse?,
            grade: freezed == grade
                ? _value.grade
                : grade // ignore: cast_nullable_to_non_nullable
                      as GradeModel?,
            stream: freezed == stream
                ? _value.stream
                : stream // ignore: cast_nullable_to_non_nullable
                      as StreamModel?,
            saved: freezed == saved
                ? _value.saved
                : saved // ignore: cast_nullable_to_non_nullable
                      as bool?,
            topics: freezed == topics
                ? _value.topics
                : topics // ignore: cast_nullable_to_non_nullable
                      as List<TopicModelResponse>?,
          )
          as $Val,
    );
  }

  /// Create a copy of ChapterModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubjectModelResponseCopyWith<$Res>? get subject {
    if (_value.subject == null) {
      return null;
    }

    return $SubjectModelResponseCopyWith<$Res>(_value.subject!, (value) {
      return _then(_value.copyWith(subject: value) as $Val);
    });
  }

  /// Create a copy of ChapterModelResponse
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

  /// Create a copy of ChapterModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GradeModelCopyWith<$Res>? get grade {
    if (_value.grade == null) {
      return null;
    }

    return $GradeModelCopyWith<$Res>(_value.grade!, (value) {
      return _then(_value.copyWith(grade: value) as $Val);
    });
  }

  /// Create a copy of ChapterModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StreamModelCopyWith<$Res>? get stream {
    if (_value.stream == null) {
      return null;
    }

    return $StreamModelCopyWith<$Res>(_value.stream!, (value) {
      return _then(_value.copyWith(stream: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChapterModelResponseImplCopyWith<$Res>
    implements $ChapterModelResponseCopyWith<$Res> {
  factory _$$ChapterModelResponseImplCopyWith(
    _$ChapterModelResponseImpl value,
    $Res Function(_$ChapterModelResponseImpl) then,
  ) = __$$ChapterModelResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    String? name,
    String? rating,
    @JsonKey(name: 'review_count') String? reviewCount,
    String? price,
    String? description,
    int? progess,
    @JsonKey(name: 'pdf_url') String? pdfUrl,
    @JsonKey(name: 'is_free') bool? isFree,
    @JsonKey(name: 'is_ordered') bool? isOrdered,
    @JsonKey(name: 'order_id') int? orderId,
    @JsonKey(name: 'semester_id') int? semesterId,
    @JsonKey(name: 'exam_attempted') bool? isExamAttempted,
    SubjectModelResponse? subject,
    TrainerModelResponse? trainer,
    GradeModel? grade,
    StreamModel? stream,
    @JsonKey(name: 'saved') bool? saved,
    List<TopicModelResponse>? topics,
  });

  @override
  $SubjectModelResponseCopyWith<$Res>? get subject;
  @override
  $TrainerModelResponseCopyWith<$Res>? get trainer;
  @override
  $GradeModelCopyWith<$Res>? get grade;
  @override
  $StreamModelCopyWith<$Res>? get stream;
}

/// @nodoc
class __$$ChapterModelResponseImplCopyWithImpl<$Res>
    extends _$ChapterModelResponseCopyWithImpl<$Res, _$ChapterModelResponseImpl>
    implements _$$ChapterModelResponseImplCopyWith<$Res> {
  __$$ChapterModelResponseImplCopyWithImpl(
    _$ChapterModelResponseImpl _value,
    $Res Function(_$ChapterModelResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChapterModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? rating = freezed,
    Object? reviewCount = freezed,
    Object? price = freezed,
    Object? description = freezed,
    Object? progess = freezed,
    Object? pdfUrl = freezed,
    Object? isFree = freezed,
    Object? isOrdered = freezed,
    Object? orderId = freezed,
    Object? semesterId = freezed,
    Object? isExamAttempted = freezed,
    Object? subject = freezed,
    Object? trainer = freezed,
    Object? grade = freezed,
    Object? stream = freezed,
    Object? saved = freezed,
    Object? topics = freezed,
  }) {
    return _then(
      _$ChapterModelResponseImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        rating: freezed == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as String?,
        reviewCount: freezed == reviewCount
            ? _value.reviewCount
            : reviewCount // ignore: cast_nullable_to_non_nullable
                  as String?,
        price: freezed == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        progess: freezed == progess
            ? _value.progess
            : progess // ignore: cast_nullable_to_non_nullable
                  as int?,
        pdfUrl: freezed == pdfUrl
            ? _value.pdfUrl
            : pdfUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        isFree: freezed == isFree
            ? _value.isFree
            : isFree // ignore: cast_nullable_to_non_nullable
                  as bool?,
        isOrdered: freezed == isOrdered
            ? _value.isOrdered
            : isOrdered // ignore: cast_nullable_to_non_nullable
                  as bool?,
        orderId: freezed == orderId
            ? _value.orderId
            : orderId // ignore: cast_nullable_to_non_nullable
                  as int?,
        semesterId: freezed == semesterId
            ? _value.semesterId
            : semesterId // ignore: cast_nullable_to_non_nullable
                  as int?,
        isExamAttempted: freezed == isExamAttempted
            ? _value.isExamAttempted
            : isExamAttempted // ignore: cast_nullable_to_non_nullable
                  as bool?,
        subject: freezed == subject
            ? _value.subject
            : subject // ignore: cast_nullable_to_non_nullable
                  as SubjectModelResponse?,
        trainer: freezed == trainer
            ? _value.trainer
            : trainer // ignore: cast_nullable_to_non_nullable
                  as TrainerModelResponse?,
        grade: freezed == grade
            ? _value.grade
            : grade // ignore: cast_nullable_to_non_nullable
                  as GradeModel?,
        stream: freezed == stream
            ? _value.stream
            : stream // ignore: cast_nullable_to_non_nullable
                  as StreamModel?,
        saved: freezed == saved
            ? _value.saved
            : saved // ignore: cast_nullable_to_non_nullable
                  as bool?,
        topics: freezed == topics
            ? _value._topics
            : topics // ignore: cast_nullable_to_non_nullable
                  as List<TopicModelResponse>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChapterModelResponseImpl implements _ChapterModelResponse {
  const _$ChapterModelResponseImpl({
    this.id,
    this.name,
    this.rating,
    @JsonKey(name: 'review_count') this.reviewCount,
    this.price,
    this.description,
    this.progess,
    @JsonKey(name: 'pdf_url') this.pdfUrl,
    @JsonKey(name: 'is_free') this.isFree,
    @JsonKey(name: 'is_ordered') this.isOrdered,
    @JsonKey(name: 'order_id') this.orderId,
    @JsonKey(name: 'semester_id') this.semesterId,
    @JsonKey(name: 'exam_attempted') this.isExamAttempted,
    this.subject,
    this.trainer,
    this.grade,
    this.stream,
    @JsonKey(name: 'saved') this.saved,
    final List<TopicModelResponse>? topics,
  }) : _topics = topics;

  factory _$ChapterModelResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChapterModelResponseImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? rating;
  @override
  @JsonKey(name: 'review_count')
  final String? reviewCount;
  @override
  final String? price;
  @override
  final String? description;
  @override
  final int? progess;
  @override
  @JsonKey(name: 'pdf_url')
  final String? pdfUrl;
  @override
  @JsonKey(name: 'is_free')
  final bool? isFree;
  @override
  @JsonKey(name: 'is_ordered')
  final bool? isOrdered;
  @override
  @JsonKey(name: 'order_id')
  final int? orderId;
  @override
  @JsonKey(name: 'semester_id')
  final int? semesterId;
  @override
  @JsonKey(name: 'exam_attempted')
  final bool? isExamAttempted;
  @override
  final SubjectModelResponse? subject;
  @override
  final TrainerModelResponse? trainer;
  @override
  final GradeModel? grade;
  @override
  final StreamModel? stream;
  @override
  @JsonKey(name: 'saved')
  final bool? saved;
  final List<TopicModelResponse>? _topics;
  @override
  List<TopicModelResponse>? get topics {
    final value = _topics;
    if (value == null) return null;
    if (_topics is EqualUnmodifiableListView) return _topics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ChapterModelResponse(id: $id, name: $name, rating: $rating, reviewCount: $reviewCount, price: $price, description: $description, progess: $progess, pdfUrl: $pdfUrl, isFree: $isFree, isOrdered: $isOrdered, orderId: $orderId, semesterId: $semesterId, isExamAttempted: $isExamAttempted, subject: $subject, trainer: $trainer, grade: $grade, stream: $stream, saved: $saved, topics: $topics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChapterModelResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.progess, progess) || other.progess == progess) &&
            (identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl) &&
            (identical(other.isFree, isFree) || other.isFree == isFree) &&
            (identical(other.isOrdered, isOrdered) ||
                other.isOrdered == isOrdered) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.semesterId, semesterId) ||
                other.semesterId == semesterId) &&
            (identical(other.isExamAttempted, isExamAttempted) ||
                other.isExamAttempted == isExamAttempted) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.trainer, trainer) || other.trainer == trainer) &&
            (identical(other.grade, grade) || other.grade == grade) &&
            (identical(other.stream, stream) || other.stream == stream) &&
            (identical(other.saved, saved) || other.saved == saved) &&
            const DeepCollectionEquality().equals(other._topics, _topics));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    name,
    rating,
    reviewCount,
    price,
    description,
    progess,
    pdfUrl,
    isFree,
    isOrdered,
    orderId,
    semesterId,
    isExamAttempted,
    subject,
    trainer,
    grade,
    stream,
    saved,
    const DeepCollectionEquality().hash(_topics),
  ]);

  /// Create a copy of ChapterModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChapterModelResponseImplCopyWith<_$ChapterModelResponseImpl>
  get copyWith =>
      __$$ChapterModelResponseImplCopyWithImpl<_$ChapterModelResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ChapterModelResponseImplToJson(this);
  }
}

abstract class _ChapterModelResponse implements ChapterModelResponse {
  const factory _ChapterModelResponse({
    final int? id,
    final String? name,
    final String? rating,
    @JsonKey(name: 'review_count') final String? reviewCount,
    final String? price,
    final String? description,
    final int? progess,
    @JsonKey(name: 'pdf_url') final String? pdfUrl,
    @JsonKey(name: 'is_free') final bool? isFree,
    @JsonKey(name: 'is_ordered') final bool? isOrdered,
    @JsonKey(name: 'order_id') final int? orderId,
    @JsonKey(name: 'semester_id') final int? semesterId,
    @JsonKey(name: 'exam_attempted') final bool? isExamAttempted,
    final SubjectModelResponse? subject,
    final TrainerModelResponse? trainer,
    final GradeModel? grade,
    final StreamModel? stream,
    @JsonKey(name: 'saved') final bool? saved,
    final List<TopicModelResponse>? topics,
  }) = _$ChapterModelResponseImpl;

  factory _ChapterModelResponse.fromJson(Map<String, dynamic> json) =
      _$ChapterModelResponseImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get rating;
  @override
  @JsonKey(name: 'review_count')
  String? get reviewCount;
  @override
  String? get price;
  @override
  String? get description;
  @override
  int? get progess;
  @override
  @JsonKey(name: 'pdf_url')
  String? get pdfUrl;
  @override
  @JsonKey(name: 'is_free')
  bool? get isFree;
  @override
  @JsonKey(name: 'is_ordered')
  bool? get isOrdered;
  @override
  @JsonKey(name: 'order_id')
  int? get orderId;
  @override
  @JsonKey(name: 'semester_id')
  int? get semesterId;
  @override
  @JsonKey(name: 'exam_attempted')
  bool? get isExamAttempted;
  @override
  SubjectModelResponse? get subject;
  @override
  TrainerModelResponse? get trainer;
  @override
  GradeModel? get grade;
  @override
  StreamModel? get stream;
  @override
  @JsonKey(name: 'saved')
  bool? get saved;
  @override
  List<TopicModelResponse>? get topics;

  /// Create a copy of ChapterModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChapterModelResponseImplCopyWith<_$ChapterModelResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
