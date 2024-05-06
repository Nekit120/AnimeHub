import 'package:anime_hub/core/domain/container/app_container.dart';
import 'package:anime_hub/feature/anime_board/presetation/favorite_anime_page/favorite_anime_vm.dart';
import 'package:anime_hub/feature/auth/presetation/auth_vm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reactive_variables/reactive_variables.dart';
import '../../../core/domain/router/router.gr.dart';
import '../../../generated/l10n.dart';
import '../../../theme/svg_image_collection.dart';
import '../../../theme/theme_colors.dart';
import '../../anime_board/presetation/anime_releses_page/anime_releases_page.dart';
import '../../anime_board/presetation/anime_releses_page/anime_releases_vm.dart';
import '../widget/scroll_to_hide_widget.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final initialRouteObs = false.rv;
  late ScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectIndex = 1.rv;
    return AutoTabsRouter(
      routes: [
        FavoriteAnimeRoute(vmFactory: (context) => FavoriteAnimeViewModel(context)),
        AnimeReleasesRoute(vmFactory: (context) => AnimeReleasesViewModel(context, controller: controller,animeBoardRepository: AppContainer().repositoryScope.animeBoardRepository)),
        AuthRoute(vmFactory: (context) => AuthViewModel(context))
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        //пришлось прибегнуть к костылю из-за того, что autoRoute отказывается делать initial виджет с required параметром,а vm required
        child: initialRouteObs.observer((context, value) => value
            ? child
            : AnimeReleasesPage(
                vmFactory: (context) => AnimeReleasesViewModel(context, controller: controller, animeBoardRepository: AppContainer().repositoryScope.animeBoardRepository))),
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return selectIndex.observer((context, value) => Scaffold(
              body: child,
              bottomNavigationBar: ScrollToHideWidget(
                controller: controller,
                child: NavigationBar(
                  elevation: 0,
                  onDestinationSelected: (value) {
                    selectIndex.value = value;
                    initialRouteObs.value = true;
                    return tabsRouter.setActiveIndex(value);
                  },
                  selectedIndex: selectIndex.value,
                  destinations: [
                     NavigationDestination(
                      icon: const Icon(Icons.favorite_border,
                          color: LightThemeColors.mdThemeLightOnSurfaceVariant),
                      selectedIcon: const Icon(Icons.favorite,
                          color: LightThemeColors.mdThemeLightOnSurface),
                      label: S.of(context).title_favorite,
                    ),
                     NavigationDestination(
                        icon: const Icon(Icons.tv,
                            color:
                                LightThemeColors.mdThemeLightOnSurfaceVariant),
                        selectedIcon: const Icon(Icons.tv,
                            color: LightThemeColors.mdThemeLightOnSurface),
                        label: S.of(context).title_watch),
                    NavigationDestination(
                      icon: SvgPicture.asset(ImageCollectionSVG.chatIcon,
                          colorFilter: const ColorFilter.mode(
                            LightThemeColors.mdThemeLightOnSurfaceVariant,
                            BlendMode.srcIn,
                          )),
                      selectedIcon:
                          SvgPicture.asset(ImageCollectionSVG.chatOutlineIcon,
                              colorFilter: const ColorFilter.mode(
                                LightThemeColors.mdThemeLightOnSurface,
                                BlendMode.srcIn,
                              )),
                      label: S.of(context).title_chat,
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
