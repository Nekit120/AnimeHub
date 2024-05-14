import 'package:anime_hub/core/domain/model/anime_api_item.dart';
import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/anime_search_favorite_state.dart';

final animeSearchFavoritesProvider = StateNotifierProvider<AnimeSearchListFavoritesNotifier, AnimeSearchFavoriteState>((ref) {
  return AnimeSearchListFavoritesNotifier();
});

class AnimeSearchListFavoritesNotifier
    extends StateNotifier<AnimeSearchFavoriteState> {
  AnimeSearchListFavoritesNotifier() : super(const AnimeSearchFavoriteState(result: null,loading: false));

  Future<void> findAnimeInFavorites(
      {required Future<Result<List<AnimeApiItem>>> Function(String title)findAnimeListByRequest, required String title}) async {
    state = state.copyWith(loading: true);
    final result = await findAnimeListByRequest(title);
    state = state.copyWith(result: result,loading: false);
  }
}

