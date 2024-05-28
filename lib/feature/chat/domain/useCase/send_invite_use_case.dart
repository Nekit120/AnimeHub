import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../repository/chat_and_auth_repository.dart';

class SendInviteUseCase{
  final ChatAndAuthRepository _chatAndAuthRepository;

  SendInviteUseCase({required ChatAndAuthRepository chatAndAuthRepository}): _chatAndAuthRepository = chatAndAuthRepository;


  Future<void> call({required String animeLink, required String animeName, required String animePoster, required String proposedId, required String acceptId}) async {
    return _chatAndAuthRepository.sendInvite(animeLink: animeLink, animeName: animeName, animePoster: animePoster, proposedId: proposedId, acceptId: acceptId);
  }
}