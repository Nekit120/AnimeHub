import '../model/anime_api_list.dart';
import '../repository/anime_board_repository.dart';

class GetAnimeListUseCase{
  final AnimeBoardRepository _animeBoardRepository;

  GetAnimeListUseCase({required AnimeBoardRepository animeBoardRepository}): _animeBoardRepository = animeBoardRepository;

  Future<AnimeApiList> getAnimeList() async {
    return _animeBoardRepository.getAnimeList();
  }

}