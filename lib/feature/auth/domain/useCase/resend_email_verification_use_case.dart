
import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';
import 'package:anime_hub/feature/auth/domain/repository/auth_repository.dart';

class ResendEmailVerificationUseCase{
  final AuthRepository _authRepository;

  ResendEmailVerificationUseCase({required AuthRepository authRepository}): _authRepository = authRepository;

  Future<void> call({required String email,password}) async {
       await _authRepository.resendEmailVerification();
  }

}