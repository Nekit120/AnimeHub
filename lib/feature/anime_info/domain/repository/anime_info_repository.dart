
import '../../../../core/domain/model/anime_api_item.dart';


abstract interface class AnimeInfoRepository {

   Future<void> insertAnimeItemInDb(AnimeApiItem animeApiItem);
}