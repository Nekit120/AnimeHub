import '../repository/anime_repository.dart';

class CheckIfAnimeIsFavoriteUseCase{
  final AnimeRepository _animeRepository;

  CheckIfAnimeIsFavoriteUseCase({required AnimeRepository animeRepository}): _animeRepository = animeRepository;

  Future<bool> call(String id) async {
    return  _animeRepository.checkIfAnimeIsFavorite(id);
  }

}