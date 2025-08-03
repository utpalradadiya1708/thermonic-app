// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationModelResponseImpl _$$NotificationModelResponseImplFromJson(
  Map<String, dynamic> json,
) => _$NotificationModelResponseImpl(
  id: (json['id'] as num?)?.toInt(),
  redirectTo: json['redirect_to'] as String?,
  redirectId: (json['redirect_id'] as num?)?.toInt(),
  title: json['title'] as String?,
  message: json['message'] as String?,
  image: json['image'] as String?,
  timeAgo: json['time_ago'] as String?,
  type: json['type'] as String?,
  seen: (json['seen'] as num?)?.toInt(),
);

Map<String, dynamic> _$$NotificationModelResponseImplToJson(
  _$NotificationModelResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'redirect_to': instance.redirectTo,
  'redirect_id': instance.redirectId,
  'title': instance.title,
  'message': instance.message,
  'image': instance.image,
  'time_ago': instance.timeAgo,
  'type': instance.type,
  'seen': instance.seen,
};
