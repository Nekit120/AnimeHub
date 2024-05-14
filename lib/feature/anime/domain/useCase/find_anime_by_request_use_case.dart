import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';

import '../../../../core/domain/model/anime_api_list.dart';
import '../repository/anime_repository.dart';

class FindAnimeByRequestUseCase{
  final AnimeRepository _animeBoardRepository;

  FindAnimeByRequestUseCase({required AnimeRepository animeBoardRepository}): _animeBoardRepository = animeBoardRepository;

  Future<Result<AnimeApiList>> call(String title) async {
    return _animeBoardRepository.findAnimeByRequest(title);
  }

}