import 'package:anime_hub/feature/anime_board/domain/model/anime_api_list.dart';
import 'package:dio/dio.dart';

import '../../../../core/domain/use_case_result/use_case_result.dart';
import '../../domain/repository/anime_board_repository.dart';
import '../data_source/remote/remote_data_provider.dart';

class AnimeBoardRepositoryImpl implements AnimeBoardRepository {
  final RemoteDataProvider _remoteDataProvider;
  AnimeBoardRepositoryImpl({required RemoteDataProvider remoteDataProvider}):_remoteDataProvider = remoteDataProvider;
  @override
  Future<Result<AnimeApiList>> getAnimeList() async {
    return _remoteDataProvider.getAnimeList();
  }
}
