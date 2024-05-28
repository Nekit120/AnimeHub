import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/domain/container/app_container.dart';
import '../../../../core/domain/model/anime_api_list.dart';
import '../../../../core/domain/router/router.gr.dart';
import '../../../../core/domain/use_case_result/use_case_result.dart';
import '../../../../core/presentation/widget/customAppBar.dart';
import '../../../../generated/l10n.dart';
import '../../domain/stateManager/releases/anime_releases_notifier.dart';
import '../widget/anime_list_builder_widget.dart';
import '../widget/error_list_widget.dart';
import 'anime_releases_vm.dart';

@RoutePage()
class AnimeReleasesPage extends BaseView<AnimeReleasesViewModel> {
  AnimeReleasesPage({super.key,required ScrollController controller}): super(
      vmFactory: (context) => AnimeReleasesViewModel(
          context,
          controller: controller,
          animeBoardRepository:
          AppContainer().repositoryScope.animeRepository)
  );

  void _customAppBarOnPressed({required BuildContext context}) {
      AutoRouter.of(context).push(AnimeSearch());
  }

  @override
  Widget build(AnimeReleasesViewModel vm) {
    final isNotHorizontal =
        MediaQuery.of(vm.context).orientation != Orientation.landscape;
    return Scaffold(
      appBar: isNotHorizontal
          ? CustomAppBar(
              titleAppBar: S.of(vm.context).title_watch, context: vm.context, onPressesCallBack: () {_customAppBarOnPressed(context:  vm.context);},
            )
          : null,
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          ref.read(animeReleasesApiProvider.notifier).getDataFromApi(
              getAnimeListFunction: vm.getAnimeListUseCase.call);
          return Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final animeApiList = ref.watch(animeReleasesApiProvider);
              switch (animeApiList) {
                case GoodUseCaseResult<AnimeApiList>(:final data):
                  return  AnimeListBuilderWidget(
                        isNotHorizontal: isNotHorizontal,
                        controller:  vm.controller ,
                        animeList: data.results,
                        context: vm.context, isFavorite: false,
                      );
                case null:
                  return const Center(child: CircularProgressIndicator());
                case BadUseCaseResult<AnimeApiList>():
                  return ErrorListWidget(titleError: S.of(context).title_error, descriptionError: S.of(context).no_internet,);
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
