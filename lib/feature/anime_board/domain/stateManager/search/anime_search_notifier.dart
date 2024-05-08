import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/domain/app_error/app_error.dart';
import '../../../../../core/domain/model/anime_api_list.dart';

final animeSearchApiProvider = StateNotifierProvider<AnimeApiListNotifier, Result<AnimeApiList>?>((ref) {
  return AnimeApiListNotifier();
});

class AnimeApiListNotifier extends StateNotifier<Result<AnimeApiList>?> {

  AnimeApiListNotifier() : super(null);

  Future<void> findDataByRequest({required Future<Result<AnimeApiList>> Function(String title) findAnimeListByRequest,required String title}) async {
    state = await findAnimeListByRequest(title);
    // switch (data) {
    //   case GoodUseCaseResult<AnimeApiList>(:final data) : {
    //     state = Result.good(data);
    //   }
    //   break;
    //   case BadUseCaseResult<AnimeApiList>():
    //     state = Result.bad([SpecificError('Server access error')]);
    //     break;
    // }
  }
}