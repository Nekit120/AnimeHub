import '../../../../core/domain/model/anime_api_item.dart';
import '../../../anime_board/domain/repository/anime_board_repository.dart';
import '../repository/anime_info_repository.dart';

class CheckIfAnimeIsFavoriteUseCase{
  final AnimeInfoRepository _animeInfoRepository;

  CheckIfAnimeIsFavoriteUseCase({required AnimeInfoRepository animeInfoRepository}): _animeInfoRepository = animeInfoRepository;

  Future<bool> call(String id) async {
    return  _animeInfoRepository.checkIfAnimeIsFavorite(id);
  }

}