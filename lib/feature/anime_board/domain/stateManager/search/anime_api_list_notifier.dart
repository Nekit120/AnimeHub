import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';
import 'package:anime_hub/feature/anime_board/data/data_source/remote/remote_data_provider.dart';
import 'package:anime_hub/feature/anime_board/data/repository/anime_board_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/domain/app_error/app_error.dart';
import '../../model/anime_api_list.dart';

final animeSearchApiProvider = StateNotifierProvider<AnimeApiListNotifier, Result<AnimeApiList>?>((ref) {

  return AnimeApiListNotifier();
});

class AnimeApiListNotifier extends StateNotifier<Result<AnimeApiList>?> {

  AnimeApiListNotifier() : super(null);

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