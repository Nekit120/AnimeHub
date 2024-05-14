import '../../../../core/domain/model/anime_api_item.dart';
import '../repository/anime_repository.dart';

class InsertAnimeItemInFavoritesUseCase{
  final AnimeRepository _animeRepository;

  InsertAnimeItemInFavoritesUseCase({required AnimeRepository animeRepository}): _animeRepository = animeRepository;

  Future<void> call(AnimeApiItem animeApiItem) async {
    await _animeRepository.insertAnimeItemInDb(animeApiItem);
  }

}