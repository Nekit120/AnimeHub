import '../../../../core/domain/model/anime_api_item.dart';
import '../repository/anime_info_repository.dart';

class InsertAnimeItemInFavoritesUseCase{
  final AnimeInfoRepository _animeInfoRepository;

  InsertAnimeItemInFavoritesUseCase({required AnimeInfoRepository animeInfoRepository}): _animeInfoRepository = animeInfoRepository;

  Future<void> call(AnimeApiItem animeApiItem) async {
    await _animeInfoRepository.insertAnimeItemInDb(animeApiItem);
  }

}