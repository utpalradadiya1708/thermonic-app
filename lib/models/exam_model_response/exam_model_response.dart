import 'package:freezed_annotation/freezed_annotation.dart';

part 'exam_model_response.freezed.dart';
part 'exam_model_response.g.dart';

@freezed
class ExamModelResponse with _$ExamModelResponse {
  const factory ExamModelResponse({
    int? id,
    String? name,
    String? image,
    @JsonKey(name: 'allowed_second') int? allowedSecond,
    @JsonKey(name: 'questions') List<Question>? questions,
    String? pdf,
  }) = _ExamModelResponse;

  factory ExamModelResponse.fromJson(Map<String, dynamic> json) =>
      _$ExamModelResponseFromJson(json);
}

@freezed
class Question with _$Question {
  const factory Question({
    int? id,
    @JsonKey(name: 'question_id') int? questionId,
    @JsonKey(name: 'question_text') String? questionText,
    List<Answer>? answers,
    @JsonKey(name: 'selected_answer_id') int? selectedAnswerId,
    @JsonKey(name: 'is_correct') int? isCorrect,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}

@freezed
class Answer with _$Answer {
  const factory Answer({
    int? id,
    @JsonKey(name: 'answer_id') int? answerId,
    @JsonKey(name: 'answer_text') String? answerText,
    @JsonKey(name: 'is_correct', fromJson: _intToBool, toJson: _boolToInt)
    bool? isCorrect,
  }) = _Answer;

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
}

bool? _intToBool(dynamic value) {
  if (value == null) return null;
  if (value is bool) return value;
  if (value is int) return value == 1;
  return false;
}

int? _boolToInt(bool? value) {
  if (value == null) return null;
  return value ? 1 : 0;
}
