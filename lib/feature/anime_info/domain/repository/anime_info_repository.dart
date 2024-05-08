
import '../../../../core/domain/model/anime_api_item.dart';
import '../../../../core/domain/use_case_result/use_case_result.dart';


abstract interface class AnimeInfoRepository {

   Future<void> insertAnimeItemInDb(AnimeApiItem animeApiItem);

   Future<Result<List<AnimeApiItem>>> updateStateManager() ;
}