// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) => MessageModel(
      senderID: json['senderID'] as String,
      senderEmail: json['senderEmail'] as String,
      receiverID: json['receiverID'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'senderID': instance.senderID,
      'senderEmail': instance.senderEmail,
      'receiverID': instance.receiverID,
      'message': instance.message,
    };
