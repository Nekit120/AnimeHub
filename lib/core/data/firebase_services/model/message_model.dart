import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'j-son_converter_timestamp.dart';

part 'message_model.g.dart';

@JsonSerializable()
class MessageModel {
  final String senderID;
  final String senderEmail;
  final String receiverID;
  final String message;
  @TimestampConverter()
  final Timestamp timestamp;

  MessageModel({
    required this.senderID,
    required this.senderEmail,
    required this.receiverID,
    required this.message,
    required this.timestamp,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}
