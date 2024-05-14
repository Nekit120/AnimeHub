import 'package:anime_hub/core/domain/model/anime_api_item.dart';
import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';

import '../repository/anime_repository.dart';

class UpdateAnimeListFromDbUseCase{
  final AnimeRepository _animeInfoRepository;

  UpdateAnimeListFromDbUseCase({required AnimeRepository animeRepository}): _animeInfoRepository = animeRepository;

  Future<Result<List<AnimeApiItem>>> call() async {
    return _animeInfoRepository.updateStateManager();
  }

}