import 'dart:developer';
import 'package:anime_hub/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:anime_hub/feature/auth/data/service/auth_service.dart';
import 'package:anime_hub/feature/auth/domain/repository/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../../feature/anime/data/data_source/local/anime_local_data_source.dart';
import '../../../feature/anime/data/data_source/remote/anime_remote_data_source.dart';
import '../../../feature/anime/data/repository/anime_repository_impl.dart';
import '../../../feature/anime/domain/repository/anime_repository.dart';
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
      final authFirebaseService = AuthFirebaseService();


      final animeBoardRepository = AnimeRepositoryImpl(
          remoteDataProvider: AnimeRemoteDataSource(Dio ()),
          animeLocalDataSource: AnimeLocalDataSource(dbProvider: dbProvider));

      final authRepository = AuthRepositoryImpl(authFirebaseService: authFirebaseService);
      repositoryScope = RepositoryScope(
          animeRepository: animeBoardRepository, authRepository: authRepository);

      // dataSourceScope = DataSourceScope(dbProvider: dbProvider);
      return true;
    } catch (e, st) {
      log('App Container has not been initialized', error: e, stackTrace: st);
      return false;
    }
  }
}

class RepositoryScope {
  final AnimeRepository animeRepository;
  final AuthRepository authRepository;

  RepositoryScope(
      {required this.animeRepository,
      required this.authRepository});
}

// class DataSourceScope {
//   final DBProvider dbProvider;
//
//   DataSourceScope({required this.dbProvider});
// }
