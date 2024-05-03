import 'package:anime_hub/anime_hub.dart';
import 'package:anime_hub/feature/anime_board/domain/model/anime_api_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/domain/container/app_container.dart';
import 'feature/anime_board/domain/service/anime_api_list_notifier.dart';

final animeApiListProvider = StateNotifierProvider<AnimeApiListNotifier, AnimeApiList?>((ref) {

  return AnimeApiListNotifier();
});

void main() {
  AppContainer.init();
  runApp(ProviderScope(child: AnimeHub(appContainer: AppContainer())));

}