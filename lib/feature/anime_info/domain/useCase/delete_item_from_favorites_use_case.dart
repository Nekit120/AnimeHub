import '../../../../core/domain/model/anime_api_item.dart';
import '../../../anime_board/domain/repository/anime_board_repository.dart';
import '../repository/anime_info_repository.dart';

class DeleteAnimeFromFavoriteUseCase{
  final AnimeInfoRepository _animeInfoRepository;

  DeleteAnimeFromFavoriteUseCase({required AnimeInfoRepository animeInfoRepository}): _animeInfoRepository = animeInfoRepository;

  Future<void> call(String id) async {
    await  _animeInfoRepository.deleteItemFromFavorite(id);
  }

}