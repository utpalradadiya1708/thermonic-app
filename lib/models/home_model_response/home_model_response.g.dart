// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeModelResponseImpl _$$HomeModelResponseImplFromJson(
  Map<String, dynamic> json,
) => _$HomeModelResponseImpl(
  subjects: (json['subjects'] as List<dynamic>?)
      ?.map((e) => SubjectModelResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
  subjectsViewAll: json['subjects_view_all'] as bool?,
  exams: (json['exams'] as List<dynamic>?)
      ?.map((e) => ExamModelResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
  examViewAll: json['exam_view_all'] as bool?,
  notificationCount: (json['notification_count'] as num?)?.toInt(),
  grades: (json['grades'] as List<dynamic>?)
      ?.map((e) => GradeModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$HomeModelResponseImplToJson(
  _$HomeModelResponseImpl instance,
) => <String, dynamic>{
  'subjects': instance.subjects,
  'subjects_view_all': instance.subjectsViewAll,
  'exams': instance.exams,
  'exam_view_all': instance.examViewAll,
  'notification_count': instance.notificationCount,
  'grades': instance.grades,
};
