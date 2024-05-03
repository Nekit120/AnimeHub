import 'package:anime_hub/anime_hub.dart';
import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';
import 'package:anime_hub/feature/anime_board/domain/model/anime_api_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/domain/container/app_container.dart';


void main() {
  AppContainer.init();
  runApp(ProviderScope(child: AnimeHub(appContainer: AppContainer())));

}