import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String uid;
  final String email;
  final String username;
  final String? profileImageUrl;
  final String? phoneNumber;
  final List<String>? friends;

  UserModel(
      {required this.uid,
      required this.email,
      required this.username,
      required this.friends,
      this.profileImageUrl,
      this.phoneNumber});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
