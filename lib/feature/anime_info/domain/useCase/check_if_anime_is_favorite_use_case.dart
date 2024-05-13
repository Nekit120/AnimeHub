import '../repository/anime_info_repository.dart';

class CheckIfAnimeIsFavoriteUseCase{
  final AnimeInfoRepository _animeInfoRepository;

  CheckIfAnimeIsFavoriteUseCase({required AnimeInfoRepository animeInfoRepository}): _animeInfoRepository = animeInfoRepository;

  Future<bool> call(String id) async {
    return  _animeInfoRepository.checkIfAnimeIsFavorite(id);
  }

}