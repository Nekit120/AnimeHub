import 'package:anime_hub/core/domain/model/anime_api_item.dart';
import 'package:anime_hub/core/domain/model/anime_api_list.dart';
import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';
import '../repository/anime_repository.dart';

class GetNextAnimePageUseCase{
  final AnimeRepository _animeBoardRepository;

  GetNextAnimePageUseCase({required AnimeRepository animeBoardRepository}): _animeBoardRepository = animeBoardRepository;

  Future<Result<AnimeApiList>> call(String url) async {
    return _animeBoardRepository.getNextAnimePage(url);
  }

}