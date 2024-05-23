import 'dart:developer';
import 'package:anime_hub/feature/chat/data/repository/chat_and_auth_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../../feature/anime/data/data_source/local/anime_local_data_source.dart';
import '../../../feature/anime/data/data_source/remote/anime_remote_data_source.dart';
import '../../../feature/anime/data/repository/anime_repository_impl.dart';
import '../../../feature/anime/domain/repository/anime_repository.dart';
import '../../../feature/chat/domain/repository/chat_and_auth_repository.dart';
import '../../data/database/database_provider.dart';
import '../../data/firebase_services/auth/auth_service.dart';
import '../../data/firebase_services/chat/chat_sevice.dart';

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
      final chatFirebaseService = ChatFirebaseService();


      final animeBoardRepository = AnimeRepositoryImpl(
          remoteDataProvider: AnimeRemoteDataSource(Dio ()),
          animeLocalDataSource: AnimeLocalDataSource(dbProvider: dbProvider));

      final authRepository = ChatAndAuthRepositoryImpl(authFirebaseService: authFirebaseService, chatFirebaseService: chatFirebaseService);
      repositoryScope = RepositoryScope(
          animeRepository: animeBoardRepository, chatAndAuthRepository: authRepository,
          // chatFirebaseService: ChatFirebaseService()
      );

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
  final ChatAndAuthRepository chatAndAuthRepository;

  RepositoryScope(
      {required this.animeRepository,
      required this.chatAndAuthRepository,});
}

// class DataSourceScope {
//   final DBProvider dbProvider;
//
//   DataSourceScope({required this.dbProvider});
// }
