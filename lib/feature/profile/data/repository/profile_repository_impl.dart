import 'package:anime_hub/core/data/firebase_services/model/user_model.dart';
import 'package:anime_hub/feature/profile/domain/repository/profile_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/data/firebase_services/auth/auth_service.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final AuthFirebaseService _authFirebaseService;

  ProfileRepositoryImpl({required AuthFirebaseService authFirebaseService})
      : _authFirebaseService = authFirebaseService;


  @override
  User? getCurrentUser()  {
    return  _authFirebaseService.getCurrentUser(

    );
  }

  @override
  Future<UserModel?> getUserByUid({required String uid}) async {
    return await _authFirebaseService.getUserByUid( uid:uid,);
  }

  @override
  Future<void> updateProfileImage({required String uid, required XFile? imageFile, required String username}) async {
    return await _authFirebaseService.updateProfileImage(uid: uid, imageFile: imageFile, username: username);
  }

}
