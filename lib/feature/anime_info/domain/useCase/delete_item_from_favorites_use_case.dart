import '../repository/anime_info_repository.dart';

class DeleteAnimeFromFavoriteUseCase{
  final AnimeInfoRepository _animeInfoRepository;

  DeleteAnimeFromFavoriteUseCase({required AnimeInfoRepository animeInfoRepository}): _animeInfoRepository = animeInfoRepository;

  Future<void> call(String id) async {
    await  _animeInfoRepository.deleteItemFromFavorite(id);
  }

}