import 'package:anime_hub/core/data/firebase_services/model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileProvider = StateNotifierProvider<ProfileNotifier, UserModel?>((ref) {

  return ProfileNotifier();
});



  class ProfileNotifier extends StateNotifier<UserModel?> {

    ProfileNotifier() : super(null);

  Future<void> updateProfile({required Future<UserModel?> getAnimeListFunction}) async {
    state = await getAnimeListFunction;

  }
}