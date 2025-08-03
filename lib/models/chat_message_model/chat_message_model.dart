import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message_model.freezed.dart';
part 'chat_message_model.g.dart';

@freezed
class ChatMessageModel with _$ChatMessageModel {
  const factory ChatMessageModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'sender_id') int? senderId,
    @JsonKey(name: 'receiver_id') int? receiverId,
    @JsonKey(name: 'message') String? text,
    @JsonKey(name: 'time') String? time,
    @JsonKey(name: 'group_of_date') String? groupOfDate,
    @JsonKey(name: 'seen') bool? seen,
    @JsonKey(name: 'type') @Default('text') String type,
  }) = _ChatMessageModel;

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageModelFromJson(json);
}
