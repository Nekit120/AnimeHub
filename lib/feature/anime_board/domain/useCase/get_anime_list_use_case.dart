import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';

import '../../../../core/domain/model/anime_api_list.dart';
import '../repository/anime_board_repository.dart';

class GetAnimeListUseCase{
  final AnimeBoardRepository _animeBoardRepository;

  GetAnimeListUseCase({required AnimeBoardRepository animeBoardRepository}): _animeBoardRepository = animeBoardRepository;

  Future<Result<AnimeApiList>> call() async {
    return _animeBoardRepository.getAnimeList();
  }

}