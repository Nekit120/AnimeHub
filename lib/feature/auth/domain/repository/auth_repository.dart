import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/domain/model/anime_api_item.dart';
import '../../../../core/domain/model/anime_api_list.dart';

abstract interface class AuthRepository {

  Future<Result<bool>> registration({required String email,password});

  Future<Result<UserCredential>> signIn({required String email,password});

  Future<void> resendEmailVerification();

}