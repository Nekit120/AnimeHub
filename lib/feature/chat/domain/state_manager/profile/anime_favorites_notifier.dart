import 'package:anime_hub/core/data/firebase_services/model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final animeFavoritesProvider = StateNotifierProvider<AnimeFavoritesNotifier, UserModel?>((ref) {

  return AnimeFavoritesNotifier();
});



  class AnimeFavoritesNotifier extends StateNotifier<UserModel?> {

  AnimeFavoritesNotifier() : super(null);

  Future<void> updateProfile({required Future<UserModel?> Function() getAnimeListFunction}) async {
    state = await getAnimeListFunction();

  }
}