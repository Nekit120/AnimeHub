import 'dart:developer';

import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/domain/model/anime_api_list.dart';

final animeReleasesApiProvider =
    StateNotifierProvider<AnimeReleasesApiNotifier, Result<AnimeApiList>?>(
        (ref) {
  return AnimeReleasesApiNotifier();
});

//Немного не подошёл
//final fetchAnimeApiListProvider = FutureProvider((ref) =>);
Result<AnimeApiList>? _previousState;

class AnimeReleasesApiNotifier extends StateNotifier<Result<AnimeApiList>?> {
  AnimeReleasesApiNotifier() : super(null);

  Future<void> getDataFromApi(
      {required Future<Result<AnimeApiList>> Function()
          getAnimeListFunction}) async {
    state = await getAnimeListFunction();
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

  Future<void> addDataFromApi(
      {required Future<Result<AnimeApiList>> Function(String id)
      getAnimeListFunction}) async {
    final dio = Dio();
    switch(state){
      case null:
        log("null dex");
      case GoodUseCaseResult<AnimeApiList>(:final data):
        final response = await dio.get(data.nextPage!);
        final result = Result.good(AnimeApiList.fromJson(response.data));
        state = result;
      case BadUseCaseResult<AnimeApiList>():
        log("bad dex");

    }
  }
}
