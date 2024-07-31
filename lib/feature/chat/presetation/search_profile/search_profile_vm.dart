import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:reactive_variables/reactive_variables.dart';
 import '../../../../core/data/firebase_services/model/user_model_with_last_message.dart';
import '../../../../core/presentation/controllers/app_text_editing_controller.dart';
import '../../domain/repository/chat_and_auth_repository.dart';
import '../../domain/useCase/get_current_user_use_case.dart';

class SearchProfilePageViewModel extends ViewModel {
  final GetCurrentUserUseCase getCurrentUserUseCase;
  final Rv<bool> isLoading = false.rv;
  final Rv<List<UserModelWithLastMessage>?> usersModelWithLastMessage = null.rv();
  SearchProfilePageViewModel(super.context,{required ChatAndAuthRepository chatAndAuthRepository}):
  getCurrentUserUseCase = GetCurrentUserUseCase(chatAndAuthRepository: chatAndAuthRepository);
  final AppTextEditingController appBarController = AppTextEditingController();



}