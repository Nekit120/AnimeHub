import 'package:anime_hub/core/domain/app_error/app_error.dart';
import 'package:anime_hub/feature/anime_board/domain/model/anime_api_list.dart';
import 'package:dio/dio.dart';

import '../../domain/repository/anime_board_repository.dart';

class AnimeBoardRepositoryImpl implements AnimeBoardRepository {
  @override
  Future<AnimeApiList> getAnimeList() async {
    final response = await Dio().get(
        "https://kodikapi.com/list?token=405c66c107c8a27b0064e1506d2ded9f&types=anime-serial&with_episodes=true&with_material_data=true&limit=30");
    print(response.data.toString());
    return AnimeApiList.fromJson(response.data);
  }
}
