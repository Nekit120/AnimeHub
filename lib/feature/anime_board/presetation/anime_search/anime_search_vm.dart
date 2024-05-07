import 'package:anime_hub/core/presentation/view/view_model.dart';
import '../../domain/repository/anime_board_repository.dart';
import '../../domain/useCase/find_anime_by_request_use_case.dart';

class AnimeSearchViewModel extends ViewModel {
  final FindAnimeByRequestUseCase findAnimeByRequestUseCase;

  AnimeSearchViewModel(super.context,
      {required AnimeBoardRepository animeBoardRepository})
      : findAnimeByRequestUseCase = FindAnimeByRequestUseCase(
            animeBoardRepository: animeBoardRepository);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
