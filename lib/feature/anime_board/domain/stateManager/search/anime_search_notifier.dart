import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/domain/model/anime_api_list.dart';
import '../state/anime_search_state.dart';

final animeSearchApiProvider =
    StateNotifierProvider<AnimeApiListNotifier, AnimeSearchState>((ref) {
  return AnimeApiListNotifier();
});

class AnimeApiListNotifier extends StateNotifier<AnimeSearchState> {
  AnimeApiListNotifier() :  super(const AnimeSearchState(result: null,loading: false));

  Future<void> findDataByRequest(
      {required Future<Result<AnimeApiList>> Function(String title)
          findAnimeListByRequest,
      required String title}) async {
    state = state.copyWith(loading: true);
    final result = await findAnimeListByRequest(title);
    state = state.copyWith(result: result,loading: false);

  }
}
