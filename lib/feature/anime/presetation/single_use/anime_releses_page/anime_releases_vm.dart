import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/domain/model/anime_api_list.dart';
import '../../../domain/repository/anime_repository.dart';
import '../../../domain/useCase/get_anime_list_use_case.dart';


// class AnimeReleasesViewModel extends ViewModel {
//
//
//   AnimeReleasesViewModel(super.context,
//       {required this.controller,
//       required AnimeRepository animeBoardRepository})
//       ;
//
//   @override
//   void initState() {
//     super.initState();
//     controller.addListener(() {
//       if (controller.position.maxScrollExtent ==
//           controller.offset &&
//           Get.find<ItemController>().itemList.length % 10 == 0) {
//         // Get.find<ItemController>()
//         //     .addItem(Get.find<ItemController>().itemList.length);
//       }
//     });
//   }
//
// }
