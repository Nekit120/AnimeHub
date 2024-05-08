import '../../../../core/domain/model/anime_api_item.dart';
import '../../../anime_board/domain/repository/anime_board_repository.dart';
import '../repository/anime_info_repository.dart';

class InsertAnimeItemInUseCase{
  final AnimeInfoRepository _animeInfoRepository;

  InsertAnimeItemInUseCase({required AnimeInfoRepository animeInfoRepository}): _animeInfoRepository = animeInfoRepository;

  Future<void> call(AnimeApiItem animeApiItem) async {
    await _animeInfoRepository.insertAnimeItemInDb(animeApiItem);
  }

}