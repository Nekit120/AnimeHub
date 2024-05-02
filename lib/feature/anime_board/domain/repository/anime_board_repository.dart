import 'package:anime_hub/feature/anime_board/domain/model/anime_api_list.dart';

abstract interface class AnimeBoardRepository{
   Future<AnimeApiList> getAnimeList();

}