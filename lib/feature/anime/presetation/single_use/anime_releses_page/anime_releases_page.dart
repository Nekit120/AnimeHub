import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_variables/reactive_variables.dart';
import '../../../../../core/domain/model/anime_api_item.dart';
import '../../../../../core/domain/model/anime_api_list.dart';
import '../../../../../core/domain/router/router.gr.dart';
import '../../../../../core/domain/use_case_result/use_case_result.dart';
import '../../../../../core/presentation/widget/customAppBar.dart';
import '../../../../../generated/l10n.dart';
import '../../../domain/repository/anime_repository.dart';
import '../../../domain/stateManager/releases/anime_releases_notifier.dart';
import '../../../domain/useCase/find_anime_by_request_use_case.dart';
import '../../../domain/useCase/get_anime_list_use_case.dart';
import '../../widget/error_list_widget.dart';

@RoutePage()
class AnimeReleasesPage extends ConsumerStatefulWidget {
  final ScrollController controller;
  final GetAnimeListUseCase getAnimeListUseCase;
  final FindAnimeByRequestUseCase findAnimeByRequestUseCase;
  final Rv<List> animeApiList = [].rv;


  AnimeReleasesPage(
      {super.key,
        required this.controller,
        required AnimeRepository animeBoardRepository})
      : getAnimeListUseCase =
  GetAnimeListUseCase(animeBoardRepository: animeBoardRepository),findAnimeByRequestUseCase =FindAnimeByRequestUseCase(animeBoardRepository: animeBoardRepository);

  @override
  ConsumerState<AnimeReleasesPage> createState() => _AnimeReleasesPageState();
}

class _AnimeReleasesPageState extends ConsumerState<AnimeReleasesPage> {
  void _customAppBarOnPressed({required BuildContext context}) {
    AutoRouter.of(context).push(AnimeSearch(onTapCallback: null));
  }
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (widget.controller.position.maxScrollExtent ==
          widget.controller.offset ) {
        ref.read(animeReleasesApiProvider.notifier).addDataFromApi(
            getAnimeListFunction: widget.findAnimeByRequestUseCase.call);
      }
    });
  }
   bool isFirstSignIn = true;
  int countSingIns = 1;


  @override
  Widget build(BuildContext context) {
    final isNotHorizontal =
        MediaQuery.of(context).orientation != Orientation.landscape;
    return Scaffold(
      appBar: isNotHorizontal
          ? CustomAppBar(
        titleAppBar: S.of(context).title_watch,
        context: context,
        onPressesCallBack: () {
          _customAppBarOnPressed(context: context);
        },
      )
          : null,
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          if(countSingIns == 1 ) {
            log("i'm here") ;
            countSingIns++;
          ref.read(animeReleasesApiProvider.notifier).getDataFromApi(
              getAnimeListFunction: widget.getAnimeListUseCase.call);
          }
          return Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final animeApiList = ref.watch(animeReleasesApiProvider);
              switch (animeApiList) {
                case GoodUseCaseResult<AnimeApiList>(:final data):

                  if(isFirstSignIn == false ) {
                    List<AnimeApiItem> animeItems = List.from(widget.animeApiList.value)..addAll(data.results);
                    widget.animeApiList.value = animeItems;
                    widget.animeApiList.refresh();
                    log(widget.animeApiList.value.length.toString() + "hui");
                  } else {
                    widget.animeApiList.value = data.results;
                    isFirstSignIn = false;
                  }
                  return widget.animeApiList.observer((context, value) =>
                  value.isEmpty == true? Container()
                      :GridView.builder(
                    controller: widget.controller,
                    gridDelegate: isNotHorizontal
                        ? const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 0.1,
                      mainAxisSpacing: 0.1,
                      childAspectRatio: 0.68,
                    )
                        : const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 0.1,
                      mainAxisSpacing: 0.1,
                      childAspectRatio: 0.67,
                    ),
                    itemCount: widget.animeApiList.value.length,
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
                                      widget.animeApiList.value[index]
                                          .materialData
                                          ?.posterUrl ??
                                          "https://shikimori.one/system/animes/original/56838.jpg",
                                      height: 255,
                                      width: 190,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ),
                            Text(widget.animeApiList.value[index].title,
                                maxLines: 1, textAlign: TextAlign.center)
                          ],
                        ),
                        onTap: () {
                          AutoRouter.of(context).push(
                              AnimeInfoRoute(animeItem: widget.animeApiList
                                  .value[index]));
                        },
                      );
                    },
                  )
                  );

                case null:
                  return const Center(child: CircularProgressIndicator());
                case BadUseCaseResult<AnimeApiList>():
                  return ErrorListWidget(
                    titleError: S.of(context).title_error,
                    descriptionError: S.of(context).no_internet,
                  );
                default:
                  return const Center(child: CircularProgressIndicator());
              }
            },
          );
        },
      ),
    );
  }
}