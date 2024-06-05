import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model_with_last_message.g.dart';

@JsonSerializable()
class UserModelWithLastMessage {
  final String uid;
  final String email;
  final String username;
  final String? profileImageUrl;
  final String? phoneNumber;
  final String? lastMessage;
  UserModelWithLastMessage ( {required this.uid,required this.email,required this.username, this.profileImageUrl,this.phoneNumber,required this.lastMessage,});

  factory UserModelWithLastMessage.fromJson(Map<String, dynamic> json) =>
      _$UserModelWithLastMessageFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelWithLastMessageToJson(this);
}