import 'package:anime_hub/core/domain/model/anime_api_item.dart';
import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';
import '../repository/anime_board_repository.dart';

class GetAnimeListFromDbUseCase{
  final AnimeBoardRepository _animeBoardRepository;

  GetAnimeListFromDbUseCase({required AnimeBoardRepository animeBoardRepository}): _animeBoardRepository = animeBoardRepository;

  Future<Result<List<AnimeApiItem>>> call() async {
    return _animeBoardRepository.getAnimeListFromDb();
  }

}