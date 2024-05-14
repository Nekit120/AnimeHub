import 'package:anime_hub/core/domain/model/anime_api_item.dart';
import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';

import '../../../../core/domain/model/anime_api_list.dart';
import '../repository/anime_board_repository.dart';

class FindAnimeInFavoritesRequestUseCase{
  final AnimeBoardRepository _animeBoardRepository;

  FindAnimeInFavoritesRequestUseCase({required AnimeBoardRepository animeBoardRepository}): _animeBoardRepository = animeBoardRepository;

  Future<Result<List<AnimeApiItem>>> call(String title) async {
    return await _animeBoardRepository.findAnimeFromFavorites(title);
  }

}