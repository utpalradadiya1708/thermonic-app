// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'semester_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SemesterModelResponseImpl _$$SemesterModelResponseImplFromJson(
  Map<String, dynamic> json,
) => _$SemesterModelResponseImpl(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  price: json['price'] as String?,
  isOrdered: json['is_ordered'] as bool?,
  orderId: (json['order_id'] as num?)?.toInt(),
  chapters: (json['chapters'] as List<dynamic>?)
      ?.map((e) => ChapterModelResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$SemesterModelResponseImplToJson(
  _$SemesterModelResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'price': instance.price,
  'is_ordered': instance.isOrdered,
  'order_id': instance.orderId,
  'chapters': instance.chapters,
};
