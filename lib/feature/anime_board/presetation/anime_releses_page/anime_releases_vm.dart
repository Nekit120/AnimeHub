import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:anime_hub/feature/anime_board/domain/model/anime_api_list.dart';
import 'package:anime_hub/feature/anime_board/domain/repository/anime_board_repository.dart';
import 'package:anime_hub/feature/anime_board/domain/useCase/get_anime_list_use_case.dart';
import 'package:flutter/cupertino.dart';
import '../../data/repository/anime_board_repository_impl.dart';

class AnimeReleasesViewModel extends ViewModel {
  final ScrollController controller;
  final GetAnimeListUseCase getAnimeListUseCase;
  late final AnimeApiList animeApiList;

  AnimeReleasesViewModel(super.context,
      {required this.controller,
      required AnimeBoardRepository animeBoardRepository})
      : getAnimeListUseCase = GetAnimeListUseCase(animeBoardRepository: animeBoardRepository);


  @override
  void initState() {
    super.initState();
  }
}
