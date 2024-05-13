import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:anime_hub/feature/anime_info/domain/repository/anime_info_repository.dart';
import 'package:anime_hub/feature/anime_info/domain/useCase/delete_item_from_favorites_use_case.dart';
import 'package:anime_hub/feature/anime_info/domain/useCase/update_anime_list_from_db_use_case.dart';
import 'package:reactive_variables/reactive_variables.dart';

import '../../../core/domain/model/anime_api_item.dart';
import '../domain/useCase/check_if_anime_is_favorite_use_case.dart';
import '../domain/useCase/insert_anime_item_in_Favorites_use_case.dart';

class AnimeInfoViewModel extends ViewModel {
  final InsertAnimeItemInFavoritesUseCase insertAnimeItemInUseCase;
  final UpdateAnimeListFromDbUseCase updateAnimeListFromDbUseCase;
  final CheckIfAnimeIsFavoriteUseCase checkIfAnimeIsFavoriteUseCase;
  final DeleteAnimeFromFavoriteUseCase deleteAnimeFromFavoriteUseCase;
  final isFavorite = false.rv;
  final checkRequest = false.rv;
  final AnimeApiItem animeItem;

  AnimeInfoViewModel(super.context,
      {required AnimeInfoRepository animeInfoRepository,
      required this.animeItem})
      : insertAnimeItemInUseCase = InsertAnimeItemInFavoritesUseCase(
            animeInfoRepository: animeInfoRepository),
        updateAnimeListFromDbUseCase = UpdateAnimeListFromDbUseCase(
            animeInfoRepository: animeInfoRepository),
        checkIfAnimeIsFavoriteUseCase = CheckIfAnimeIsFavoriteUseCase(
            animeInfoRepository: animeInfoRepository),
        deleteAnimeFromFavoriteUseCase = DeleteAnimeFromFavoriteUseCase(
            animeInfoRepository: animeInfoRepository);

  void checkIfAnimeIsFavorite() async {
    isFavorite.value = await checkIfAnimeIsFavoriteUseCase.call(animeItem.id);
    checkRequest.value = true;
  }

  void addAnimeInFavorite(AnimeApiItem animeItem) async {
    if (isFavorite.value == true) {
      await deleteAnimeFromFavoriteUseCase.call(animeItem.id);
      checkIfAnimeIsFavorite();
    } else {
      await insertAnimeItemInUseCase.call(animeItem);
      checkIfAnimeIsFavorite();
    }
  }

  @override
  void initState() {
    checkIfAnimeIsFavorite();
    super.initState();
  }
}
