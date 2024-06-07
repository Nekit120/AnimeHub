// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model_with_last_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModelWithLastMessage _$UserModelWithLastMessageFromJson(
        Map<String, dynamic> json) =>
    UserModelWithLastMessage(
      uid: json['uid'] as String,
      email: json['email'] as String,
      username: json['username'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      lastMessage: json['lastMessage'] as String?,
      friends:
          (json['friends'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UserModelWithLastMessageToJson(
        UserModelWithLastMessage instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'username': instance.username,
      'profileImageUrl': instance.profileImageUrl,
      'friends': instance.friends,
      'phoneNumber': instance.phoneNumber,
      'lastMessage': instance.lastMessage,
    };
