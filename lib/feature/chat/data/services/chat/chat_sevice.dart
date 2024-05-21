// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class ChatFirebaseService {
//
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   Stream<List<Map<String,dynamic>>> getUsersStream() {
//     return _firestore.collection("Users").snapshots().map((snapshots)  {
//     return snapshots.docs.map((doc) {
//      final users = doc.data();
//      return users;
//     }
//     ).toList();
//     });
//   }
//
// }
