// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChapterModelResponseImpl _$$ChapterModelResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ChapterModelResponseImpl(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  rating: json['rating'] as String?,
  reviewCount: json['review_count'] as String?,
  price: json['price'] as String?,
  description: json['description'] as String?,
  progess: (json['progess'] as num?)?.toInt(),
  pdfUrl: json['pdf_url'] as String?,
  isFree: json['is_free'] as bool?,
  isOrdered: json['is_ordered'] as bool?,
  orderId: (json['order_id'] as num?)?.toInt(),
  semesterId: (json['semester_id'] as num?)?.toInt(),
  isExamAttempted: json['exam_attempted'] as bool?,
  subject: json['subject'] == null
      ? null
      : SubjectModelResponse.fromJson(json['subject'] as Map<String, dynamic>),
  trainer: json['trainer'] == null
      ? null
      : TrainerModelResponse.fromJson(json['trainer'] as Map<String, dynamic>),
  grade: json['grade'] == null
      ? null
      : GradeModel.fromJson(json['grade'] as Map<String, dynamic>),
  stream: json['stream'] == null
      ? null
      : StreamModel.fromJson(json['stream'] as Map<String, dynamic>),
  saved: json['saved'] as bool?,
  topics: (json['topics'] as List<dynamic>?)
      ?.map((e) => TopicModelResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$ChapterModelResponseImplToJson(
  _$ChapterModelResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'rating': instance.rating,
  'review_count': instance.reviewCount,
  'price': instance.price,
  'description': instance.description,
  'progess': instance.progess,
  'pdf_url': instance.pdfUrl,
  'is_free': instance.isFree,
  'is_ordered': instance.isOrdered,
  'order_id': instance.orderId,
  'semester_id': instance.semesterId,
  'exam_attempted': instance.isExamAttempted,
  'subject': instance.subject,
  'trainer': instance.trainer,
  'grade': instance.grade,
  'stream': instance.stream,
  'saved': instance.saved,
  'topics': instance.topics,
};
