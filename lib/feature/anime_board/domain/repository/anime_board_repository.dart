import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';
import 'package:anime_hub/feature/anime_board/domain/model/anime_api_list.dart';

abstract interface class AnimeBoardRepository{
   Future<Result<AnimeApiList>> getAnimeList();
}