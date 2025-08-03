// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExamModelResponseImpl _$$ExamModelResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ExamModelResponseImpl(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  image: json['image'] as String?,
  allowedSecond: (json['allowed_second'] as num?)?.toInt(),
  questions: (json['questions'] as List<dynamic>?)
      ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
      .toList(),
  pdf: json['pdf'] as String?,
);

Map<String, dynamic> _$$ExamModelResponseImplToJson(
  _$ExamModelResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'image': instance.image,
  'allowed_second': instance.allowedSecond,
  'questions': instance.questions,
  'pdf': instance.pdf,
};

_$QuestionImpl _$$QuestionImplFromJson(Map<String, dynamic> json) =>
    _$QuestionImpl(
      id: (json['id'] as num?)?.toInt(),
      questionId: (json['question_id'] as num?)?.toInt(),
      questionText: json['question_text'] as String?,
      answers: (json['answers'] as List<dynamic>?)
          ?.map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
      selectedAnswerId: (json['selected_answer_id'] as num?)?.toInt(),
      isCorrect: (json['is_correct'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$QuestionImplToJson(_$QuestionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question_id': instance.questionId,
      'question_text': instance.questionText,
      'answers': instance.answers,
      'selected_answer_id': instance.selectedAnswerId,
      'is_correct': instance.isCorrect,
    };

_$AnswerImpl _$$AnswerImplFromJson(Map<String, dynamic> json) => _$AnswerImpl(
  id: (json['id'] as num?)?.toInt(),
  answerId: (json['answer_id'] as num?)?.toInt(),
  answerText: json['answer_text'] as String?,
  isCorrect: _intToBool(json['is_correct']),
);

Map<String, dynamic> _$$AnswerImplToJson(_$AnswerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'answer_id': instance.answerId,
      'answer_text': instance.answerText,
      'is_correct': _boolToInt(instance.isCorrect),
    };
