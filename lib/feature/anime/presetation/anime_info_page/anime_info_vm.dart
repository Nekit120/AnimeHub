 import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:anime_hub/feature/anime/domain/useCase/update_anime_list_from_db_use_case.dart';
import 'package:reactive_variables/reactive_variables.dart';
import '../../../../core/domain/model/anime_api_item.dart';
import '../../domain/repository/anime_repository.dart';
import '../../domain/useCase/check_if_anime_is_favorite_use_case.dart';
import '../../domain/useCase/delete_item_from_favorites_use_case.dart';
import '../../domain/useCase/insert_anime_item_in_Favorites_use_case.dart';

class AnimeInfoViewModel extends ViewModel {
  final InsertAnimeItemInFavoritesUseCase insertAnimeItemInUseCase;
  final UpdateAnimeListFromDbUseCase updateAnimeListFromDbUseCase;
  final CheckIfAnimeIsFavoriteUseCase checkIfAnimeIsFavoriteUseCase;
  final DeleteAnimeFromFavoriteUseCase deleteAnimeFromFavoriteUseCase;
  final isFavorite = false.rv;
  final checkRequest = false.rv;
  final AnimeApiItem animeItem;

  AnimeInfoViewModel(super.context,
      {required AnimeRepository animeRepository,
      required this.animeItem})
      : insertAnimeItemInUseCase = InsertAnimeItemInFavoritesUseCase(
            animeRepository: animeRepository),
        updateAnimeListFromDbUseCase = UpdateAnimeListFromDbUseCase(
            animeRepository: animeRepository),
        checkIfAnimeIsFavoriteUseCase = CheckIfAnimeIsFavoriteUseCase(
            animeRepository: animeRepository),
        deleteAnimeFromFavoriteUseCase = DeleteAnimeFromFavoriteUseCase(
            animeRepository: animeRepository);

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
