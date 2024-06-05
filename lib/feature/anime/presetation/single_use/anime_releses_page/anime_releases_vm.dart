import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/domain/model/anime_api_list.dart';
import '../../../domain/repository/anime_repository.dart';
import '../../../domain/useCase/get_anime_list_use_case.dart';


class AnimeReleasesViewModel extends ViewModel {
  final ScrollController controller;
  final GetAnimeListUseCase getAnimeListUseCase;
  late final AnimeApiList animeApiList;

  AnimeReleasesViewModel(super.context,
      {required this.controller,
      required AnimeRepository animeBoardRepository})
      : getAnimeListUseCase = GetAnimeListUseCase(animeBoardRepository: animeBoardRepository);

}
