import '../repository/anime_repository.dart';

class DeleteAnimeFromFavoriteUseCase{
  final AnimeRepository _animeRepository;

  DeleteAnimeFromFavoriteUseCase({required AnimeRepository animeRepository}): _animeRepository = animeRepository;

  Future<void> call(String id) async {
    await  _animeRepository.deleteItemFromFavorite(id);
  }

}