import 'package:anime_hub/core/domain/model/anime_api_item.dart';
import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final animeFavoritesProvider = StateNotifierProvider<AnimeFavoritesNotifier, Result<List<AnimeApiItem>>?>((ref) {

  return AnimeFavoritesNotifier();
});

//Немного не подошёл
//final fetchAnimeApiListProvider = FutureProvider((ref) =>);

class AnimeFavoritesNotifier extends StateNotifier<Result<List<AnimeApiItem>>?> {

  AnimeFavoritesNotifier() : super(null);

  Future<void> getDataFromDb({required Future<Result<List<AnimeApiItem>>> Function() getAnimeListFunction}) async {
    state = await getAnimeListFunction();
    // switch (data) {
    //   case GoodUseCaseResult<List<AnimeApiItem>>(:final data) : {
    //     state = Result.good(data);
    //   }
    //   break;
    //   case BadUseCaseResult<List<AnimeApiItem>>():
    //     state = Result.bad([SpecificError('Server access error')]);
    //     break;
    //
    // }
  }
}