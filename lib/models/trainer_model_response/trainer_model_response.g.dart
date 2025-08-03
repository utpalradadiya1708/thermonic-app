// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrainerModelResponseImpl _$$TrainerModelResponseImplFromJson(
  Map<String, dynamic> json,
) => _$TrainerModelResponseImpl(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  image: json['image'] as String?,
);

Map<String, dynamic> _$$TrainerModelResponseImplToJson(
  _$TrainerModelResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'image': instance.image,
};
