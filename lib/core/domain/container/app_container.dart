import 'dart:developer';

import 'package:anime_hub/feature/anime_board/data/data_source/remote/remote_data_provider.dart';
import 'package:anime_hub/feature/anime_board/data/repository/anime_board_repository_impl.dart';
import 'package:anime_hub/feature/anime_board/domain/repository/anime_board_repository.dart';
import 'package:get_it/get_it.dart';

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
      final animeBoardRepository = AnimeBoardRepositoryImpl(remoteDataProvider: RemoteDataProvider());

      repositoryScope = RepositoryScope(animeBoardRepository: animeBoardRepository);

      return true;
    } catch (e, st) {
      log('App Container has not been initialized', error: e, stackTrace: st);
      return false;
    }
  }
}

class RepositoryScope {
  final AnimeBoardRepository animeBoardRepository;

  RepositoryScope({required this.animeBoardRepository});
}
