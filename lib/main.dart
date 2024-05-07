import 'package:anime_hub/anime_hub.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/domain/container/app_container.dart';

void main() {
  AppContainer.init();
  runApp(ProviderScope(child: AnimeHub(appContainer: AppContainer())));
}
