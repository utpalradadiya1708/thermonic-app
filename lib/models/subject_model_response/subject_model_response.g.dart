// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubjectModelResponseImpl _$$SubjectModelResponseImplFromJson(
  Map<String, dynamic> json,
) => _$SubjectModelResponseImpl(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  image: json['image'] as String?,
  price: json['price'] as String?,
  isOrdered: json['is_ordered'] as bool?,
  orderId: (json['order_id'] as num?)?.toInt(),
  examAttempted: json['exam_attempted'] as bool?,
  description: json['description'] as String?,
  semesters: (json['semesters'] as List<dynamic>?)
      ?.map((e) => SemesterModelResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
  trainer: json['trainer'] == null
      ? null
      : TrainerModelResponse.fromJson(json['trainer'] as Map<String, dynamic>),
  reviewData: json['reviews'] == null
      ? null
      : ReviewModelResponse.fromJson(json['reviews'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$SubjectModelResponseImplToJson(
  _$SubjectModelResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'image': instance.image,
  'price': instance.price,
  'is_ordered': instance.isOrdered,
  'order_id': instance.orderId,
  'exam_attempted': instance.examAttempted,
  'description': instance.description,
  'semesters': instance.semesters,
  'trainer': instance.trainer,
  'reviews': instance.reviewData,
};
