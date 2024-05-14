import 'package:anime_hub/core/domain/model/anime_api_item.dart';
import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';
import '../repository/anime_repository.dart';

class GetAnimeListFromDbUseCase{
  final AnimeRepository _animeBoardRepository;

  GetAnimeListFromDbUseCase({required AnimeRepository animeBoardRepository}): _animeBoardRepository = animeBoardRepository;

  Future<Result<List<AnimeApiItem>>> call() async {
    return _animeBoardRepository.getAnimeListFromDb();
  }

}