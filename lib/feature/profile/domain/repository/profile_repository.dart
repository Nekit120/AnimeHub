import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/data/firebase_services/model/user_model.dart';

abstract interface class ProfileRepository {

  User? getCurrentUser();

  Future<UserModel?> getUserByUid({required String uid});

 Future<void> updateProfileImage({required String uid,required XFile? imageFile});
}
