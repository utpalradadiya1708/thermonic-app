// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginationResponseImpl<T> _$$PaginationResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _$PaginationResponseImpl<T>(
  totalPages: (json['total_pages'] as num).toInt(),
  isOrdered: json['is_ordered'] as bool?,
  orderId: (json['order_id'] as num?)?.toInt(),
  subjectName: json['subject_name'] as String?,
  gradeName: json['grade_name'] as String?,
  streamName: json['stream_name'] as String?,
  trainer: json['trainer'] == null
      ? null
      : TrainerModelResponse.fromJson(json['trainer'] as Map<String, dynamic>),
  price: json['price'] as String?,
  results: (json['results'] as List<dynamic>).map(fromJsonT).toList(),
);

Map<String, dynamic> _$$PaginationResponseImplToJson<T>(
  _$PaginationResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'total_pages': instance.totalPages,
  'is_ordered': instance.isOrdered,
  'order_id': instance.orderId,
  'subject_name': instance.subjectName,
  'grade_name': instance.gradeName,
  'stream_name': instance.streamName,
  'trainer': instance.trainer,
  'price': instance.price,
  'results': instance.results.map(toJsonT).toList(),
};
