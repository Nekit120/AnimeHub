import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:anime_hub/feature/anime_info/domain/repository/anime_info_repository.dart';

import '../domain/useCase/insert_anime_item_in_db_use_case.dart';

class AnimeInfoViewModel extends ViewModel {
  final InsertAnimeItemInUseCase insertAnimeItemInUseCase;
  AnimeInfoViewModel(super.context,{required AnimeInfoRepository animeInfoRepository}):insertAnimeItemInUseCase = InsertAnimeItemInUseCase(animeInfoRepository: animeInfoRepository);

}
