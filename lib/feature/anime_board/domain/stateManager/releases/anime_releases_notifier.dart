import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/domain/app_error/app_error.dart';
import '../../../../../core/domain/model/anime_api_list.dart';

final animeReleasesApiProvider = StateNotifierProvider<AnimeReleasesApiNotifier, Result<AnimeApiList>?>((ref) {

  return AnimeReleasesApiNotifier();
});

//Немного не подошёл
//final fetchAnimeApiListProvider = FutureProvider((ref) =>);

class AnimeReleasesApiNotifier extends StateNotifier<Result<AnimeApiList>?> {

  AnimeReleasesApiNotifier() : super(null);

  Future<void> fetchData({required Future<Result<AnimeApiList>> Function() getAnimeListFunction}) async {
    final data = await getAnimeListFunction();
    switch (data) {
      case GoodUseCaseResult<AnimeApiList>(:final data) : {
        state = Result.good(data);
      }
      break;
      case BadUseCaseResult<AnimeApiList>():
        state = Result.bad([SpecificError('Server access error')]);
        break;
    }
  }
}