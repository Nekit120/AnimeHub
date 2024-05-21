
import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';
import 'package:anime_hub/feature/auth/domain/repository/auth_repository.dart';

class RegistrationWithEmailUseCase{
  final AuthRepository _authRepository;

  RegistrationWithEmailUseCase({required AuthRepository authRepository}): _authRepository = authRepository;

  Future<Result<bool>> call({required String email,password}) async {
    final requestResult = await _authRepository.registration(email: email,password: password );
    return requestResult;
  }

}