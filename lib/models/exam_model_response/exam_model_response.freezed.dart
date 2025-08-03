// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exam_model_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ExamModelResponse _$ExamModelResponseFromJson(Map<String, dynamic> json) {
  return _ExamModelResponse.fromJson(json);
}

/// @nodoc
mixin _$ExamModelResponse {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'allowed_second')
  int? get allowedSecond => throw _privateConstructorUsedError;
  @JsonKey(name: 'questions')
  List<Question>? get questions => throw _privateConstructorUsedError;
  String? get pdf => throw _privateConstructorUsedError;

  /// Serializes this ExamModelResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExamModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExamModelResponseCopyWith<ExamModelResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExamModelResponseCopyWith<$Res> {
  factory $ExamModelResponseCopyWith(
    ExamModelResponse value,
    $Res Function(ExamModelResponse) then,
  ) = _$ExamModelResponseCopyWithImpl<$Res, ExamModelResponse>;
  @useResult
  $Res call({
    int? id,
    String? name,
    String? image,
    @JsonKey(name: 'allowed_second') int? allowedSecond,
    @JsonKey(name: 'questions') List<Question>? questions,
    String? pdf,
  });
}

/// @nodoc
class _$ExamModelResponseCopyWithImpl<$Res, $Val extends ExamModelResponse>
    implements $ExamModelResponseCopyWith<$Res> {
  _$ExamModelResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExamModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? allowedSecond = freezed,
    Object? questions = freezed,
    Object? pdf = freezed,
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
            allowedSecond: freezed == allowedSecond
                ? _value.allowedSecond
                : allowedSecond // ignore: cast_nullable_to_non_nullable
                      as int?,
            questions: freezed == questions
                ? _value.questions
                : questions // ignore: cast_nullable_to_non_nullable
                      as List<Question>?,
            pdf: freezed == pdf
                ? _value.pdf
                : pdf // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ExamModelResponseImplCopyWith<$Res>
    implements $ExamModelResponseCopyWith<$Res> {
  factory _$$ExamModelResponseImplCopyWith(
    _$ExamModelResponseImpl value,
    $Res Function(_$ExamModelResponseImpl) then,
  ) = __$$ExamModelResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    String? name,
    String? image,
    @JsonKey(name: 'allowed_second') int? allowedSecond,
    @JsonKey(name: 'questions') List<Question>? questions,
    String? pdf,
  });
}

/// @nodoc
class __$$ExamModelResponseImplCopyWithImpl<$Res>
    extends _$ExamModelResponseCopyWithImpl<$Res, _$ExamModelResponseImpl>
    implements _$$ExamModelResponseImplCopyWith<$Res> {
  __$$ExamModelResponseImplCopyWithImpl(
    _$ExamModelResponseImpl _value,
    $Res Function(_$ExamModelResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExamModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? allowedSecond = freezed,
    Object? questions = freezed,
    Object? pdf = freezed,
  }) {
    return _then(
      _$ExamModelResponseImpl(
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
        allowedSecond: freezed == allowedSecond
            ? _value.allowedSecond
            : allowedSecond // ignore: cast_nullable_to_non_nullable
                  as int?,
        questions: freezed == questions
            ? _value._questions
            : questions // ignore: cast_nullable_to_non_nullable
                  as List<Question>?,
        pdf: freezed == pdf
            ? _value.pdf
            : pdf // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ExamModelResponseImpl implements _ExamModelResponse {
  const _$ExamModelResponseImpl({
    this.id,
    this.name,
    this.image,
    @JsonKey(name: 'allowed_second') this.allowedSecond,
    @JsonKey(name: 'questions') final List<Question>? questions,
    this.pdf,
  }) : _questions = questions;

  factory _$ExamModelResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExamModelResponseImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? image;
  @override
  @JsonKey(name: 'allowed_second')
  final int? allowedSecond;
  final List<Question>? _questions;
  @override
  @JsonKey(name: 'questions')
  List<Question>? get questions {
    final value = _questions;
    if (value == null) return null;
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? pdf;

  @override
  String toString() {
    return 'ExamModelResponse(id: $id, name: $name, image: $image, allowedSecond: $allowedSecond, questions: $questions, pdf: $pdf)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExamModelResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.allowedSecond, allowedSecond) ||
                other.allowedSecond == allowedSecond) &&
            const DeepCollectionEquality().equals(
              other._questions,
              _questions,
            ) &&
            (identical(other.pdf, pdf) || other.pdf == pdf));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    image,
    allowedSecond,
    const DeepCollectionEquality().hash(_questions),
    pdf,
  );

  /// Create a copy of ExamModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExamModelResponseImplCopyWith<_$ExamModelResponseImpl> get copyWith =>
      __$$ExamModelResponseImplCopyWithImpl<_$ExamModelResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ExamModelResponseImplToJson(this);
  }
}

abstract class _ExamModelResponse implements ExamModelResponse {
  const factory _ExamModelResponse({
    final int? id,
    final String? name,
    final String? image,
    @JsonKey(name: 'allowed_second') final int? allowedSecond,
    @JsonKey(name: 'questions') final List<Question>? questions,
    final String? pdf,
  }) = _$ExamModelResponseImpl;

  factory _ExamModelResponse.fromJson(Map<String, dynamic> json) =
      _$ExamModelResponseImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get image;
  @override
  @JsonKey(name: 'allowed_second')
  int? get allowedSecond;
  @override
  @JsonKey(name: 'questions')
  List<Question>? get questions;
  @override
  String? get pdf;

  /// Create a copy of ExamModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExamModelResponseImplCopyWith<_$ExamModelResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return _Question.fromJson(json);
}

/// @nodoc
mixin _$Question {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_id')
  int? get questionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_text')
  String? get questionText => throw _privateConstructorUsedError;
  List<Answer>? get answers => throw _privateConstructorUsedError;
  @JsonKey(name: 'selected_answer_id')
  int? get selectedAnswerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_correct')
  int? get isCorrect => throw _privateConstructorUsedError;

  /// Serializes this Question to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuestionCopyWith<Question> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) =
      _$QuestionCopyWithImpl<$Res, Question>;
  @useResult
  $Res call({
    int? id,
    @JsonKey(name: 'question_id') int? questionId,
    @JsonKey(name: 'question_text') String? questionText,
    List<Answer>? answers,
    @JsonKey(name: 'selected_answer_id') int? selectedAnswerId,
    @JsonKey(name: 'is_correct') int? isCorrect,
  });
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res, $Val extends Question>
    implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? questionId = freezed,
    Object? questionText = freezed,
    Object? answers = freezed,
    Object? selectedAnswerId = freezed,
    Object? isCorrect = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            questionId: freezed == questionId
                ? _value.questionId
                : questionId // ignore: cast_nullable_to_non_nullable
                      as int?,
            questionText: freezed == questionText
                ? _value.questionText
                : questionText // ignore: cast_nullable_to_non_nullable
                      as String?,
            answers: freezed == answers
                ? _value.answers
                : answers // ignore: cast_nullable_to_non_nullable
                      as List<Answer>?,
            selectedAnswerId: freezed == selectedAnswerId
                ? _value.selectedAnswerId
                : selectedAnswerId // ignore: cast_nullable_to_non_nullable
                      as int?,
            isCorrect: freezed == isCorrect
                ? _value.isCorrect
                : isCorrect // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QuestionImplCopyWith<$Res>
    implements $QuestionCopyWith<$Res> {
  factory _$$QuestionImplCopyWith(
    _$QuestionImpl value,
    $Res Function(_$QuestionImpl) then,
  ) = __$$QuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    @JsonKey(name: 'question_id') int? questionId,
    @JsonKey(name: 'question_text') String? questionText,
    List<Answer>? answers,
    @JsonKey(name: 'selected_answer_id') int? selectedAnswerId,
    @JsonKey(name: 'is_correct') int? isCorrect,
  });
}

/// @nodoc
class __$$QuestionImplCopyWithImpl<$Res>
    extends _$QuestionCopyWithImpl<$Res, _$QuestionImpl>
    implements _$$QuestionImplCopyWith<$Res> {
  __$$QuestionImplCopyWithImpl(
    _$QuestionImpl _value,
    $Res Function(_$QuestionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? questionId = freezed,
    Object? questionText = freezed,
    Object? answers = freezed,
    Object? selectedAnswerId = freezed,
    Object? isCorrect = freezed,
  }) {
    return _then(
      _$QuestionImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        questionId: freezed == questionId
            ? _value.questionId
            : questionId // ignore: cast_nullable_to_non_nullable
                  as int?,
        questionText: freezed == questionText
            ? _value.questionText
            : questionText // ignore: cast_nullable_to_non_nullable
                  as String?,
        answers: freezed == answers
            ? _value._answers
            : answers // ignore: cast_nullable_to_non_nullable
                  as List<Answer>?,
        selectedAnswerId: freezed == selectedAnswerId
            ? _value.selectedAnswerId
            : selectedAnswerId // ignore: cast_nullable_to_non_nullable
                  as int?,
        isCorrect: freezed == isCorrect
            ? _value.isCorrect
            : isCorrect // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionImpl implements _Question {
  const _$QuestionImpl({
    this.id,
    @JsonKey(name: 'question_id') this.questionId,
    @JsonKey(name: 'question_text') this.questionText,
    final List<Answer>? answers,
    @JsonKey(name: 'selected_answer_id') this.selectedAnswerId,
    @JsonKey(name: 'is_correct') this.isCorrect,
  }) : _answers = answers;

  factory _$QuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'question_id')
  final int? questionId;
  @override
  @JsonKey(name: 'question_text')
  final String? questionText;
  final List<Answer>? _answers;
  @override
  List<Answer>? get answers {
    final value = _answers;
    if (value == null) return null;
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'selected_answer_id')
  final int? selectedAnswerId;
  @override
  @JsonKey(name: 'is_correct')
  final int? isCorrect;

  @override
  String toString() {
    return 'Question(id: $id, questionId: $questionId, questionText: $questionText, answers: $answers, selectedAnswerId: $selectedAnswerId, isCorrect: $isCorrect)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.questionText, questionText) ||
                other.questionText == questionText) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.selectedAnswerId, selectedAnswerId) ||
                other.selectedAnswerId == selectedAnswerId) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    questionId,
    questionText,
    const DeepCollectionEquality().hash(_answers),
    selectedAnswerId,
    isCorrect,
  );

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith =>
      __$$QuestionImplCopyWithImpl<_$QuestionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionImplToJson(this);
  }
}

abstract class _Question implements Question {
  const factory _Question({
    final int? id,
    @JsonKey(name: 'question_id') final int? questionId,
    @JsonKey(name: 'question_text') final String? questionText,
    final List<Answer>? answers,
    @JsonKey(name: 'selected_answer_id') final int? selectedAnswerId,
    @JsonKey(name: 'is_correct') final int? isCorrect,
  }) = _$QuestionImpl;

  factory _Question.fromJson(Map<String, dynamic> json) =
      _$QuestionImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'question_id')
  int? get questionId;
  @override
  @JsonKey(name: 'question_text')
  String? get questionText;
  @override
  List<Answer>? get answers;
  @override
  @JsonKey(name: 'selected_answer_id')
  int? get selectedAnswerId;
  @override
  @JsonKey(name: 'is_correct')
  int? get isCorrect;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Answer _$AnswerFromJson(Map<String, dynamic> json) {
  return _Answer.fromJson(json);
}

/// @nodoc
mixin _$Answer {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer_id')
  int? get answerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer_text')
  String? get answerText => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_correct', fromJson: _intToBool, toJson: _boolToInt)
  bool? get isCorrect => throw _privateConstructorUsedError;

  /// Serializes this Answer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Answer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnswerCopyWith<Answer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerCopyWith<$Res> {
  factory $AnswerCopyWith(Answer value, $Res Function(Answer) then) =
      _$AnswerCopyWithImpl<$Res, Answer>;
  @useResult
  $Res call({
    int? id,
    @JsonKey(name: 'answer_id') int? answerId,
    @JsonKey(name: 'answer_text') String? answerText,
    @JsonKey(name: 'is_correct', fromJson: _intToBool, toJson: _boolToInt)
    bool? isCorrect,
  });
}

/// @nodoc
class _$AnswerCopyWithImpl<$Res, $Val extends Answer>
    implements $AnswerCopyWith<$Res> {
  _$AnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Answer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? answerId = freezed,
    Object? answerText = freezed,
    Object? isCorrect = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            answerId: freezed == answerId
                ? _value.answerId
                : answerId // ignore: cast_nullable_to_non_nullable
                      as int?,
            answerText: freezed == answerText
                ? _value.answerText
                : answerText // ignore: cast_nullable_to_non_nullable
                      as String?,
            isCorrect: freezed == isCorrect
                ? _value.isCorrect
                : isCorrect // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AnswerImplCopyWith<$Res> implements $AnswerCopyWith<$Res> {
  factory _$$AnswerImplCopyWith(
    _$AnswerImpl value,
    $Res Function(_$AnswerImpl) then,
  ) = __$$AnswerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    @JsonKey(name: 'answer_id') int? answerId,
    @JsonKey(name: 'answer_text') String? answerText,
    @JsonKey(name: 'is_correct', fromJson: _intToBool, toJson: _boolToInt)
    bool? isCorrect,
  });
}

/// @nodoc
class __$$AnswerImplCopyWithImpl<$Res>
    extends _$AnswerCopyWithImpl<$Res, _$AnswerImpl>
    implements _$$AnswerImplCopyWith<$Res> {
  __$$AnswerImplCopyWithImpl(
    _$AnswerImpl _value,
    $Res Function(_$AnswerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Answer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? answerId = freezed,
    Object? answerText = freezed,
    Object? isCorrect = freezed,
  }) {
    return _then(
      _$AnswerImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        answerId: freezed == answerId
            ? _value.answerId
            : answerId // ignore: cast_nullable_to_non_nullable
                  as int?,
        answerText: freezed == answerText
            ? _value.answerText
            : answerText // ignore: cast_nullable_to_non_nullable
                  as String?,
        isCorrect: freezed == isCorrect
            ? _value.isCorrect
            : isCorrect // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AnswerImpl implements _Answer {
  const _$AnswerImpl({
    this.id,
    @JsonKey(name: 'answer_id') this.answerId,
    @JsonKey(name: 'answer_text') this.answerText,
    @JsonKey(name: 'is_correct', fromJson: _intToBool, toJson: _boolToInt)
    this.isCorrect,
  });

  factory _$AnswerImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnswerImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'answer_id')
  final int? answerId;
  @override
  @JsonKey(name: 'answer_text')
  final String? answerText;
  @override
  @JsonKey(name: 'is_correct', fromJson: _intToBool, toJson: _boolToInt)
  final bool? isCorrect;

  @override
  String toString() {
    return 'Answer(id: $id, answerId: $answerId, answerText: $answerText, isCorrect: $isCorrect)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.answerId, answerId) ||
                other.answerId == answerId) &&
            (identical(other.answerText, answerText) ||
                other.answerText == answerText) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, answerId, answerText, isCorrect);

  /// Create a copy of Answer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnswerImplCopyWith<_$AnswerImpl> get copyWith =>
      __$$AnswerImplCopyWithImpl<_$AnswerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnswerImplToJson(this);
  }
}

abstract class _Answer implements Answer {
  const factory _Answer({
    final int? id,
    @JsonKey(name: 'answer_id') final int? answerId,
    @JsonKey(name: 'answer_text') final String? answerText,
    @JsonKey(name: 'is_correct', fromJson: _intToBool, toJson: _boolToInt)
    final bool? isCorrect,
  }) = _$AnswerImpl;

  factory _Answer.fromJson(Map<String, dynamic> json) = _$AnswerImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'answer_id')
  int? get answerId;
  @override
  @JsonKey(name: 'answer_text')
  String? get answerText;
  @override
  @JsonKey(name: 'is_correct', fromJson: _intToBool, toJson: _boolToInt)
  bool? get isCorrect;

  /// Create a copy of Answer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnswerImplCopyWith<_$AnswerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
