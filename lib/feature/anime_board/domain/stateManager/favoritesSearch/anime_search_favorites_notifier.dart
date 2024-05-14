import 'package:anime_hub/core/domain/model/anime_api_item.dart';
import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final animeSearchFavoritesProvider = StateNotifierProvider<AnimeSearchListFavoritesNotifier, Result<List<AnimeApiItem>>?>((ref) {
  return AnimeSearchListFavoritesNotifier();
});

class AnimeSearchListFavoritesNotifier
    extends StateNotifier<Result<List<AnimeApiItem>>?> {
  AnimeSearchListFavoritesNotifier() : super(null);

  Future<void> findAnimeInFavorites(
      {required Future<Result<List<AnimeApiItem>>> Function(String title)findAnimeListByRequest, required String title}) async {
    state = await findAnimeListByRequest(title);
  }
}
