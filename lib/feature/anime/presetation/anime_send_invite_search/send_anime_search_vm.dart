import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:anime_hub/feature/chat/domain/repository/chat_and_auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../../domain/repository/anime_repository.dart';
import '../../domain/useCase/find_anime_by_request_use_case.dart';

class SendAnimeSearchViewModel extends ViewModel {
  final FindAnimeByRequestUseCase findAnimeByRequestUseCase;
  final ChatAndAuthRepository chatAndAuthRepository;
  final String proposedId;
  final String acceptId;

  SendAnimeSearchViewModel(super.context,
      {required AnimeRepository animeBoardRepository,required this.chatAndAuthRepository,required this.acceptId,required this.proposedId})
      : findAnimeByRequestUseCase = FindAnimeByRequestUseCase(
            animeBoardRepository: animeBoardRepository);

  @override
  void initState() {
    super.initState();
    final isNotHorizontal = MediaQuery.of(context).orientation != Orientation.landscape;
    if (isNotHorizontal){
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);}
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }
}
