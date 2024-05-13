import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';

import '../../../../core/domain/model/anime_api_item.dart';
import '../../../../core/domain/model/anime_api_list.dart';

abstract interface class AnimeBoardRepository {
   Future<Result<AnimeApiList>> getAnimeList();

   Future<Result<List<AnimeApiItem>>> getAnimeListFromDb();

   Future<Result<AnimeApiList>> findAnimeByRequest(String title);
}