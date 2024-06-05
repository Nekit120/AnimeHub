import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';

import '../../../../core/domain/model/anime_api_item.dart';
import '../../../../core/domain/model/anime_api_list.dart';

abstract interface class AnimeRepository {
   Future<Result<AnimeApiList>> getAnimeList();

   Future<Result<AnimeApiList>> getNextAnimePage(String url);

   Future<Result<List<AnimeApiItem>>> getAnimeListFromDb();

   Future<Result<AnimeApiList>> findAnimeByRequest(String title);

   Future<Result<List<AnimeApiItem>>> findAnimeFromFavorites(String excerptTitle);

   Future<void> insertAnimeItemInDb(AnimeApiItem animeApiItem);

   Future<Result<List<AnimeApiItem>>>  updateStateManager() ;

   Future<bool> checkIfAnimeIsFavorite(String id) ;

   Future<void> deleteItemFromFavorite(String id) ;

}