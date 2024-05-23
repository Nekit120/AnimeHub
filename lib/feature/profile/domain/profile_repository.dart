import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/data/firebase_services/model/user_model.dart';

abstract interface class ProfileRepository {

  User? getCurrentUser();


}
