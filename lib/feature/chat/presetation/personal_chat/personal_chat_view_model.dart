import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:anime_hub/feature/chat/domain/useCase/get_current_user_use_case.dart';
import 'package:anime_hub/feature/chat/domain/useCase/send_message_use_case.dart';

import '../../domain/repository/chat_and_auth_repository.dart';
import '../../domain/useCase/get_message_use_case.dart';

class PersonalChatViewModel extends ViewModel {
  final GetMessageUseCase getMessageUseCase;
  GetCurrentUserUseCase getCurrentUserUseCase;
  final SendMessageUseCase sendMessageUseCase;

  PersonalChatViewModel(super.context,
      {required ChatAndAuthRepository chatAndAuthRepository})
      : getMessageUseCase =
            GetMessageUseCase(chatAndAuthRepository: chatAndAuthRepository),
        sendMessageUseCase =
            SendMessageUseCase(chatAndAuthRepository: chatAndAuthRepository),
  getCurrentUserUseCase =  GetCurrentUserUseCase(chatAndAuthRepository: chatAndAuthRepository);
}
