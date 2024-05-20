import 'package:anime_hub/anime_hub.dart';
import 'package:anime_hub/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/domain/container/app_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  AppContainer.init();

  runApp(ProviderScope(child: AnimeHub(appContainer: AppContainer())));
}
