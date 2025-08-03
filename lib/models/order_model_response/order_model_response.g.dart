// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderModelResponseImpl _$$OrderModelResponseImplFromJson(
  Map<String, dynamic> json,
) => _$OrderModelResponseImpl(
  id: (json['id'] as num?)?.toInt(),
  total: json['total'] as String?,
  name: json['name'] as String?,
  image: json['image'] as String?,
  type: json['type'] as String?,
  expiryDaysRemaining: (json['expiry_days_remaining'] as num?)?.toInt(),
  subjectId: (json['subject_id'] as num?)?.toInt(),
  gradeId: (json['grade_id'] as num?)?.toInt(),
  streamId: (json['stream_id'] as num?)?.toInt(),
  isExpired: json['is_expired'] as bool?,
  gradeName: json['grade_name'] as String?,
  streamName: json['stream_name'] as String?,
  createdDate: json['created_date'] as String?,
  expiryDate: json['expiry_date'] as String?,
  semesterName: json['semester_name'] as String?,
  examAttempted: json['exam_attempted'] as bool?,
);

Map<String, dynamic> _$$OrderModelResponseImplToJson(
  _$OrderModelResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'total': instance.total,
  'name': instance.name,
  'image': instance.image,
  'type': instance.type,
  'expiry_days_remaining': instance.expiryDaysRemaining,
  'subject_id': instance.subjectId,
  'grade_id': instance.gradeId,
  'stream_id': instance.streamId,
  'is_expired': instance.isExpired,
  'grade_name': instance.gradeName,
  'stream_name': instance.streamName,
  'created_date': instance.createdDate,
  'expiry_date': instance.expiryDate,
  'semester_name': instance.semesterName,
  'exam_attempted': instance.examAttempted,
};
