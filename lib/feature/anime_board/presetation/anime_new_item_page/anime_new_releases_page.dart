import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:anime_hub/feature/anime_board/presetation/anime_new_item_page/anime_releases_vm.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/domain/router/router.gr.dart';
import '../../../../main.dart';



@RoutePage()
class AnimeNewReleasesPage extends BaseView<AnimeReleasesViewModel> {
  const AnimeNewReleasesPage({super.key, required super.vmFactory});
  AppBar  _profileAppBar({required AnimeReleasesViewModel vm}) => AppBar(
        title: Text("Просмотр"),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.search,
              ),
              onPressed: () {}),
          IconButton(
              icon: const Icon(
                Icons.settings,
              ),
              onPressed: () {}),
        ],
      );

  @override
  Widget build(AnimeReleasesViewModel vm) {
    double containerWidth = MediaQuery.of(vm.context).size.width / 2 - 24;
    return Scaffold(
      appBar: _profileAppBar(vm: vm),
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
           ref.read(animeApiListProvider.notifier).fetchData();
          return Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final animeApiList = ref.watch(animeApiListProvider);
              return animeApiList != null
                  ? GridView.builder(
                controller: vm.controller,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  childAspectRatio: 0.67,
                ),
                itemCount: animeApiList.results.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: Column(
                      children: [
                        Card(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: SizedBox(
                            child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12)),
                                child: Image.network(
                                  animeApiList.results[index].materialData?.posterUrl ?? "https://shikimori.one/system/animes/original/56838.jpg",
                                  height: 255,
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ),
                        Text(
                            animeApiList.results[index].title ?? "",
                            maxLines: 2,
                            textAlign: TextAlign.center)
                      ],
                    ),
                    onTap: () {
                      AutoRouter.of(vm.context).push(AnimeInfoRoute(animeItem: animeApiList.results[index] ));
                    },
                  );
                },
              )
                  : const Center(child: CircularProgressIndicator());
            },
          );
        }));
  }
}

//   @override
//   Widget build(AnimeReleasesViewModel vm) {
//     double containerWidth = MediaQuery.of(vm.context).size.width / 2 - 24;
//
//     return Scaffold(
//       appBar: _profileAppBar,
//       body: ListView.builder(
//         itemCount: 20,
//         itemBuilder: (BuildContext context, int index) {
//           return Padding(
//             padding: const EdgeInsets.all(8),
//             child: Row(
//               children: [
//                 Column(
//                   children: [
//                     Card(
//                       elevation: 12,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12)
//                       ),
//                       child: SizedBox(
//                         child: ClipRRect(
//                           borderRadius: const BorderRadius.all( Radius.circular(12)),
//                           child: Image.network(
//                             "https://animego.org/media/cache/thumbs_250x350/upload/anime/images/660422bc9b2ce463846791.jpg",
//                             width: containerWidth,
//                           ),
//                         ),
//                       ),
//                     ),
//
//                     Text("Темный дворецкий"),
//                   ],
//                 ),
//                 const SizedBox(width: 16),
//                 Column(
//                   children: [
//                     Card(
//                       elevation: 8,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12)
//                       ),
//                       child: SizedBox(
//                         child: ClipRRect(
//                           borderRadius: const BorderRadius.all( Radius.circular(12)),
//                           child: Image.network(
//                             "https://animego.org/media/cache/thumbs_250x350/upload/anime/images/660422bc9b2ce463846791.jpg",
//                             width: containerWidth,
//                           ),
//                         ),
//                       ),
//                     ),
//
//                     Text("Темный дворецкий"),
//                   ],
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
