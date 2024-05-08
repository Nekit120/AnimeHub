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

}
