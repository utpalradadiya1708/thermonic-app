// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelResponseImpl _$$UserModelResponseImplFromJson(
  Map<String, dynamic> json,
) => _$UserModelResponseImpl(
  user: UserData.fromJson(json['user'] as Map<String, dynamic>),
  grades: (json['grades'] as List<dynamic>?)
      ?.map((e) => GradeModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$UserModelResponseImplToJson(
  _$UserModelResponseImpl instance,
) => <String, dynamic>{'user': instance.user, 'grades': instance.grades};

_$UserDataImpl _$$UserDataImplFromJson(Map<String, dynamic> json) =>
    _$UserDataImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      phoneFormatted: json['phone_formatted'] as String?,
      email: json['email'] as String?,
      gradeId: (json['grade_id'] as num?)?.toInt(),
      streamId: (json['stream_id'] as num?)?.toInt(),
      profilePictureFullUrl: json['profile_picture_full_url'] as String?,
      language: json['language'] as String?,
      isProfileSetup: json['isProfileSetup'] as bool?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$UserDataImplToJson(_$UserDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'phone_formatted': instance.phoneFormatted,
      'email': instance.email,
      'grade_id': instance.gradeId,
      'stream_id': instance.streamId,
      'profile_picture_full_url': instance.profilePictureFullUrl,
      'language': instance.language,
      'isProfileSetup': instance.isProfileSetup,
      'token': instance.token,
    };

_$GradeModelImpl _$$GradeModelImplFromJson(Map<String, dynamic> json) =>
    _$GradeModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      streams: (json['streams'] as List<dynamic>?)
          ?.map((e) => StreamModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GradeModelImplToJson(_$GradeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'streams': instance.streams,
    };

_$StreamModelImpl _$$StreamModelImplFromJson(Map<String, dynamic> json) =>
    _$StreamModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$StreamModelImplToJson(_$StreamModelImpl instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
