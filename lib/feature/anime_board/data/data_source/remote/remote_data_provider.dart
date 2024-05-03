import 'package:dio/dio.dart';

import '../../../../../core/domain/app_error/app_error.dart';
import '../../../../../core/domain/use_case_result/use_case_result.dart';
import '../../../domain/model/anime_api_list.dart';

class RemoteDataProvider {

  Future<Result<AnimeApiList>> getAnimeList() async {
      try{
        final response = await Dio().get("https://kodikapi.com/list?token=405c66c107c8a27b0064e1506d2ded9f&types=anime-serial&with_episodes=true&with_material_data=true&limit=30");

        if (response.data == null) {
          return Result.bad([SpecificError('Empty response data')]);
        }

        return Result.good(AnimeApiList.fromJson(response.data));

      }catch (e) {
        return Result.bad([SpecificError('Server access error')]);
      }
  }

}