// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatMessageModelImpl _$$ChatMessageModelImplFromJson(
  Map<String, dynamic> json,
) => _$ChatMessageModelImpl(
  id: (json['id'] as num?)?.toInt(),
  senderId: (json['sender_id'] as num?)?.toInt(),
  receiverId: (json['receiver_id'] as num?)?.toInt(),
  text: json['message'] as String?,
  time: json['time'] as String?,
  groupOfDate: json['group_of_date'] as String?,
  seen: json['seen'] as bool?,
  type: json['type'] as String? ?? 'text',
);

Map<String, dynamic> _$$ChatMessageModelImplToJson(
  _$ChatMessageModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'sender_id': instance.senderId,
  'receiver_id': instance.receiverId,
  'message': instance.text,
  'time': instance.time,
  'group_of_date': instance.groupOfDate,
  'seen': instance.seen,
  'type': instance.type,
};
