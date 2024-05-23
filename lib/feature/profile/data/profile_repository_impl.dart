import 'package:anime_hub/feature/profile/domain/profile_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/data/firebase_services/auth/auth_service.dart';

class ChatAndAuthRepositoryImpl implements ProfileRepository {
  final AuthFirebaseService _authFirebaseService;

  ChatAndAuthRepositoryImpl({required AuthFirebaseService authFirebaseService})
      : _authFirebaseService = authFirebaseService;


  @override
  User? getCurrentUser()  {
    return  _authFirebaseService.getCurrentUser(

    );
  }




}
