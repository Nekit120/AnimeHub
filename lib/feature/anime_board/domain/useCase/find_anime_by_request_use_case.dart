import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';

import '../../../../core/domain/model/anime_api_list.dart';
import '../repository/anime_board_repository.dart';

class FindAnimeByRequestUseCase{
  final AnimeBoardRepository _animeBoardRepository;

  FindAnimeByRequestUseCase({required AnimeBoardRepository animeBoardRepository}): _animeBoardRepository = animeBoardRepository;

  Future<Result<AnimeApiList>> call(String title) async {
    return _animeBoardRepository.findAnimeByRequest(title);
  }

}