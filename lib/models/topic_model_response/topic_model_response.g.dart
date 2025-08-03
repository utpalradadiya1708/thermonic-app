// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TopicModelResponseImpl _$$TopicModelResponseImplFromJson(
  Map<String, dynamic> json,
) => _$TopicModelResponseImpl(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  video: json['video'] as String?,
  duration: json['duration'] as String?,
  thumbnailImage: json['thumbnail_image'] as String?,
);

Map<String, dynamic> _$$TopicModelResponseImplToJson(
  _$TopicModelResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'video': instance.video,
  'duration': instance.duration,
  'thumbnail_image': instance.thumbnailImage,
};
