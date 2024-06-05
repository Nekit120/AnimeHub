import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:anime_hub/feature/profile/domain/repository/profile_repository.dart';
import 'package:anime_hub/feature/profile/domain/useCase/get_current_user_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reactive_variables/reactive_variables.dart';

import '../../../../core/data/firebase_services/model/user_model.dart';
import '../../domain/useCase/get_current_user_by_uid_use_case.dart';

class ProfileViewModel extends ViewModel {
  final GetCurrentUserUseCase getCurrentUserUseCase;
  final GetCurrentUserByUidUseCase getCurrentUserByUidUseCase;
  final Rv<UserModel?> currentUser = null.rv<UserModel?>();


  ProfileViewModel(super.context,
      {required ProfileRepository profileRepository})
      : getCurrentUserUseCase =
            GetCurrentUserUseCase(profileRepository: profileRepository),
  getCurrentUserByUidUseCase = GetCurrentUserByUidUseCase(profileRepository: profileRepository);


  Future<UserModel?> getCurrentUserByUid() async {
    return await getCurrentUserByUidUseCase.call(uid:currentUser.value!.uid);
  }


  getCurrentUserOnStart() async {
    final User? user = getCurrentUserUseCase.call();
    currentUser.value = await getCurrentUserByUidUseCase.call(
        uid:user!.uid);
  }

  @override
  void initState() {
    getCurrentUserOnStart();
    super.initState();
  }
}
