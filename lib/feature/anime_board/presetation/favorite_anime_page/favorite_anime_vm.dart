import 'package:anime_hub/core/domain/model/anime_api_item.dart';
import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:anime_hub/feature/anime_board/domain/repository/anime_board_repository.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/domain/use_case_result/use_case_result.dart';
import '../../domain/useCase/get_anime_list_from_db_use_case.dart';

class FavoriteAnimeViewModel extends ViewModel {
  final ScrollController controller;
  final GetAnimeListFromDbUseCase getAnimeListFromDbUseCase;
  late List<AnimeApiItem> animList;
  FavoriteAnimeViewModel(super.context,
      {required this.controller,
      required AnimeBoardRepository animeBoardRepository})
      : getAnimeListFromDbUseCase = GetAnimeListFromDbUseCase(
            animeBoardRepository: animeBoardRepository);


}
