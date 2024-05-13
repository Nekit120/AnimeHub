import '../../../../core/data/database/dataSource/anime_local_data_source.dart';
import '../../../../core/domain/app_error/app_error.dart';
import '../../../../core/domain/model/anime_api_item.dart';
import '../../../../core/domain/model/anime_api_list.dart';
import '../../../../core/domain/use_case_result/use_case_result.dart';
import '../../domain/repository/anime_board_repository.dart';
import '../data_source/remote/remote_data_provider.dart';

class AnimeBoardRepositoryImpl implements AnimeBoardRepository {
  final RemoteDataProvider _remoteDataProvider;
  final AnimeLocalDataSource _animeLocalDataSource;

  AnimeBoardRepositoryImpl(
      {required RemoteDataProvider remoteDataProvider,
      required AnimeLocalDataSource animeLocalDataSource})
      : _remoteDataProvider = remoteDataProvider,
        _animeLocalDataSource = animeLocalDataSource;

  @override
  Future<Result<AnimeApiList>> getAnimeList() async {
    try{
        final animeApiList = await _remoteDataProvider.getAnimeList();

        return Result.good(animeApiList);

      }catch (e) {
        return Result.bad([SpecificError('Server access error')]);
      }
  }

  @override
  Future<Result<AnimeApiList>> findAnimeByRequest(String title) async {
    try{
      final animeApiList =  await _remoteDataProvider.findAnimeByRequest(title: title);
      return Result.good(animeApiList);
    }catch (e) {
      return Result.bad([SpecificError('Server access error')]);
    }
  }

  @override
  Future<Result<List<AnimeApiItem>>> getAnimeListFromDb() async {
    return  await _animeLocalDataSource.getAnimeListFromDb();
  }
}
