// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_search_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommonSearchModelResponseImpl _$$CommonSearchModelResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CommonSearchModelResponseImpl(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  image: json['image'] as String?,
  price: json['price'] as String?,
  type: json['type'] as String?,
);

Map<String, dynamic> _$$CommonSearchModelResponseImplToJson(
  _$CommonSearchModelResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'image': instance.image,
  'price': instance.price,
  'type': instance.type,
};
