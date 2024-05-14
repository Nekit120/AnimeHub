import 'dart:developer';

import 'package:anime_hub/core/data/database/dataSource/anime_local_data_source.dart';
import 'package:anime_hub/feature/anime_board/data/data_source/remote/remote_data_provider.dart';
import 'package:anime_hub/feature/anime_board/data/repository/anime_board_repository_impl.dart';
import 'package:anime_hub/feature/anime_board/domain/repository/anime_board_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../feature/anime_info/data/repository/anime_info_repository_impl.dart';
import '../../data/database/database_provider.dart';

class AppContainer {
  late final RepositoryScope repositoryScope;

  AppContainer.init() {
    ready = initDependencies();
    GetIt.instance.registerSingleton(this);
  }

  factory AppContainer() => GetIt.instance<AppContainer>();

  late final Future<bool> ready;

  Future<bool> initDependencies() async {
    try {
      final dbProvider = DBProvider();

      final animeBoardRepository = AnimeBoardRepositoryImpl(
          remoteDataProvider: RemoteDataProvider(Dio()),
          animeLocalDataSource: AnimeLocalDataSource(dbProvider: dbProvider));
      final animeInfoRepository =
          AnimeInfoRepositoryImpl(dbProvider: dbProvider);

      repositoryScope = RepositoryScope(
          animeBoardRepository: animeBoardRepository,
          animeInfoRepository: animeInfoRepository);

      // dataSourceScope = DataSourceScope(dbProvider: dbProvider);
      return true;
    } catch (e, st) {
      log('App Container has not been initialized', error: e, stackTrace: st);
      return false;
    }
  }
}

class RepositoryScope {
  final AnimeBoardRepository animeBoardRepository;
  final AnimeInfoRepositoryImpl animeInfoRepository;

  RepositoryScope(
      {required this.animeBoardRepository, required this.animeInfoRepository});
}

// class DataSourceScope {
//   final DBProvider dbProvider;
//
//   DataSourceScope({required this.dbProvider});
// }
