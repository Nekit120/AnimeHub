import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';
import 'package:anime_hub/feature/anime_info/domain/repository/anime_info_repository.dart';
import '../../../../core/data/database/database_provider.dart';
import '../../../../core/domain/model/anime_api_item.dart';
import '../../../../core/data/database/dataSource/anime_local_data_source.dart';

class AnimeInfoRepositoryImpl implements AnimeInfoRepository {

    final AnimeLocalDataSource _animeLocalDataSource;
    AnimeInfoRepositoryImpl({required DBProvider dbProvider }):_animeLocalDataSource = AnimeLocalDataSource(dbProvider: dbProvider);

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



}
