//
// import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';
//
// import '../repository/chat_and_auth_repository.dart';
//
// class GetUsersStreamUseCase{
//   final AuthRepository _authRepository;
//
//   GetUsersStreamUseCase({required AuthRepository authRepository}): _authRepository = authRepository;
//
//   Stream<List<Map<String, dynamic>>>  call()  {
//     final requestResult =  _authRepository.getUsersStream();
//     return requestResult;
//   }
//
// }