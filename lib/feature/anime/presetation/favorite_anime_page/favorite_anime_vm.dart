import 'package:anime_hub/core/domain/model/anime_api_item.dart';
import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:flutter/cupertino.dart';
import '../../domain/repository/anime_repository.dart';
import '../../domain/useCase/get_anime_list_from_db_use_case.dart';

class FavoriteAnimeViewModel extends ViewModel {
  final ScrollController controller;
  final GetAnimeListFromDbUseCase getAnimeListFromDbUseCase;
  late List<AnimeApiItem> animList;
  FavoriteAnimeViewModel(super.context,
      {required this.controller,
      required AnimeRepository animeBoardRepository})
      : getAnimeListFromDbUseCase = GetAnimeListFromDbUseCase(
            animeBoardRepository: animeBoardRepository);


}
