import 'package:anime_hub/feature/anime_board/data/repository/anime_board_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/anime_api_list.dart';

class AnimeApiListNotifier extends StateNotifier<AnimeApiList?> {
  AnimeApiListNotifier() : super(null);

  Future<void> fetchData() async {
    final data = await AnimeBoardRepositoryImpl().getAnimeList();
    state = data;
  }
}