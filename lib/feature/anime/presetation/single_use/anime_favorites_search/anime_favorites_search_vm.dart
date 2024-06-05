import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../../../domain/repository/anime_repository.dart';
import '../../../domain/useCase/find_anime_in_favorites_request_use_case.dart';

class AnimeFavoritesSearchViewModel extends ViewModel {
  final FindAnimeInFavoritesRequestUseCase findAnimeInFavoritesRequestUseCase;

  AnimeFavoritesSearchViewModel(super.context,
      {required AnimeRepository animeRepository})
      : findAnimeInFavoritesRequestUseCase = FindAnimeInFavoritesRequestUseCase(animeBoardRepository: animeRepository);

  @override
  void initState() {
    super.initState();
    final isNotHorizontal = MediaQuery.of(context).orientation != Orientation.landscape;
    if (isNotHorizontal){
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);}
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }
}
