import 'package:anime_hub/core/domain/model/anime_api_item.dart';
import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';
import 'package:anime_hub/feature/anime_info/domain/repository/anime_info_repository.dart';

class UpdateAnimeListFromDbUseCase{
  final AnimeInfoRepository _animeInfoRepository;

  UpdateAnimeListFromDbUseCase({required AnimeInfoRepository animeInfoRepository}): _animeInfoRepository = animeInfoRepository;

  Future<Result<List<AnimeApiItem>>> call() async {
    return _animeInfoRepository.updateStateManager();
  }

}