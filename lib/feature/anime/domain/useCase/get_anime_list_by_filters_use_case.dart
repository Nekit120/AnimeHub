import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';

import '../../../../core/domain/model/anime_api_list.dart';
import '../repository/anime_repository.dart';

class GetAnimeListByFiltersUseCase{
  final AnimeRepository _animeBoardRepository;

  GetAnimeListByFiltersUseCase({required AnimeRepository animeBoardRepository}): _animeBoardRepository = animeBoardRepository;

  Future<Result<AnimeApiList>> call({required List<String> genres,required String? year,required double rait}) async {
    return _animeBoardRepository.getAnimeListByFilters(genres: genres, year:year,rait: rait);
  }

}