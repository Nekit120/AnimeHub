import 'package:dio/dio.dart';

import '../../../../core/domain/app_error/app_error.dart';
import '../../../../core/domain/model/anime_api_item.dart';
import '../../../../core/domain/model/anime_api_list.dart';
import '../../../../core/domain/use_case_result/use_case_result.dart';
import '../../domain/repository/anime_repository.dart';
import '../data_source/local/anime_local_data_source.dart';
import '../data_source/model/find_anime_by_request_query.dart';
import '../data_source/remote/anime_remote_data_source.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  final AnimeRemoteDataSource _remoteDataProvider;
  final AnimeLocalDataSource _animeLocalDataSource;

  AnimeRepositoryImpl(
      {required AnimeRemoteDataSource remoteDataProvider,
      required animeLocalDataSource})
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
      final animeApiList =  await _remoteDataProvider.findAnimeByRequest(query: FindAnimeByRequestQuery(title));
      return Result.good(animeApiList);
    }catch (e) {
      return Result.bad([SpecificError('Server access error')]);
    }
  }

  @override
  Future<Result<List<AnimeApiItem>>> getAnimeListFromDb() async {
    return  await _animeLocalDataSource.getAnimeListFromDb();
  }

  @override
  Future<Result<List<AnimeApiItem>>> findAnimeFromFavorites(String excerptTitle) async{
    return await _animeLocalDataSource.searchAnimeInFavorites(excerptTitle: excerptTitle);
  }

  @override
  Future<void> insertAnimeItemInDb(AnimeApiItem animeApiItem) async {
    await _animeLocalDataSource.insertAnimeItem(animeApiItem);
  }

  @override
  Future<Result<List<AnimeApiItem>>> updateStateManager() async {
    return await _animeLocalDataSource.getAnimeListFromDb();
  }

  @override
  Future<bool> checkIfAnimeIsFavorite(String id) async {
    return await _animeLocalDataSource.checkIfAnimeIsFavorite(id);
  }

  @override
  Future<void> deleteItemFromFavorite(String id) async{
    await _animeLocalDataSource.deleteItemFromFavorite(id);
  }

  @override
  Future<Result<AnimeApiList>> getNextAnimePage(String url) async {
    final dio = Dio();
    final response = await dio.get(url);
    final result = Result.good(AnimeApiList.fromJson(response.data));
    return result;
  }
}
