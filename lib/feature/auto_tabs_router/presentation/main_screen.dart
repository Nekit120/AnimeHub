import 'package:anime_hub/core/domain/container/app_container.dart';
import 'package:anime_hub/feature/anime_board/presetation/anime_search/anime_search_vm.dart';
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
  final selectIndex = 1.rv;
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

  void _arrayOverrunProtection({required bool isNotHorizontal}) {
    if (isNotHorizontal && selectIndex.value >2) {
      selectIndex.value = 1;
      AutoRouter.of(context).pushAndPopUntil(  AnimeReleasesRoute(
          vmFactory: (context) => AnimeReleasesViewModel(context,
              controller: controller,
              animeBoardRepository:
              AppContainer().repositoryScope.animeBoardRepository)), predicate:  (route) => false );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isNotHorizontal = MediaQuery.of(context).orientation != Orientation.landscape;
    _arrayOverrunProtection(isNotHorizontal: isNotHorizontal);
    return AutoTabsRouter(
      routes: [
        FavoriteAnimeRoute(
            vmFactory: (context) => FavoriteAnimeViewModel(context, controller: controller)),
        AnimeReleasesRoute(
            vmFactory: (context) => AnimeReleasesViewModel(context,
                controller: controller,
                animeBoardRepository:
                    AppContainer().repositoryScope.animeBoardRepository)),
        AuthRoute(vmFactory: (context) => AuthViewModel(context)),
        AnimeSearch(vmFactory:(context) => AnimeSearchViewModel(context, animeBoardRepository: AppContainer().repositoryScope.animeBoardRepository))
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        //пришлось прибегнуть к костылю из-за того, что autoRoute отказывается делать initial виджет с required параметром,а vm required
        child: initialRouteObs.observer((context, value) => value
            ? child
            : AnimeReleasesPage(
                vmFactory: (context) => AnimeReleasesViewModel(context,
                    controller: controller,
                    animeBoardRepository:
                        AppContainer().repositoryScope.animeBoardRepository))),
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return selectIndex.observer((context, value) => Scaffold(
              body: isNotHorizontal ? child : Row(
                children: [
                  NavigationRail(
                    labelType: NavigationRailLabelType.all,
                    destinations: <NavigationRailDestination>[
                      NavigationRailDestination(
                        icon: const Icon(Icons.favorite_border,
                            color: LightThemeColors
                                .mdThemeLightOnSurfaceVariant),
                        selectedIcon: const Icon(Icons.favorite,
                            color: LightThemeColors.mdThemeLightOnSurface),
                        label: Text(S.of(context).title_favorite),
                      ),
                      NavigationRailDestination(
                        icon: const Icon(Icons.tv,
                            color: LightThemeColors
                                .mdThemeLightOnSurfaceVariant),
                        selectedIcon: const Icon(Icons.tv,
                            color:
                            LightThemeColors.mdThemeLightOnSurface),
                        label: Text(S.of(context).title_watch),
                      ),
                      NavigationRailDestination(
                        icon: SvgPicture.asset(ImageCollectionSVG.chatIcon,
                            colorFilter: const ColorFilter.mode(
                              LightThemeColors.mdThemeLightOnSurfaceVariant,
                              BlendMode.srcIn,
                            )),
                        selectedIcon: SvgPicture.asset(
                            ImageCollectionSVG.chatOutlineIcon,
                            colorFilter: const ColorFilter.mode(
                              LightThemeColors.mdThemeLightOnSurface,
                              BlendMode.srcIn,
                            )),
                        label: Text(S.of(context).title_chat),
                      ),
                      NavigationRailDestination(
                        icon: const Icon(Icons.search_outlined,
                            color: LightThemeColors
                                .mdThemeLightOnSurfaceVariant),
                        selectedIcon: const Icon(Icons.search_outlined,
                            color: LightThemeColors.mdThemeLightOnSurface),
                        label: Text(S.of(context).title_search),
                      ),
                    ],
                    selectedIndex: selectIndex.value,
                    onDestinationSelected: (value) {
                      selectIndex.value = value;
                      initialRouteObs.value = true;
                      return tabsRouter.setActiveIndex(value);
                    },
                  ),
                  Expanded(child: child)
                ],
              ),
              bottomNavigationBar:  isNotHorizontal
                  ? ScrollToHideWidget(
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
                                color: LightThemeColors
                                    .mdThemeLightOnSurfaceVariant),
                            selectedIcon: const Icon(Icons.favorite,
                                color: LightThemeColors.mdThemeLightOnSurface),
                            label: S.of(context).title_favorite,
                          ),
                          NavigationDestination(
                              icon: const Icon(Icons.tv,
                                  color: LightThemeColors
                                      .mdThemeLightOnSurfaceVariant),
                              selectedIcon: const Icon(Icons.tv,
                                  color:
                                      LightThemeColors.mdThemeLightOnSurface),
                              label: S.of(context).title_watch),
                          NavigationDestination(
                            icon: SvgPicture.asset(ImageCollectionSVG.chatIcon,
                                colorFilter: const ColorFilter.mode(
                                  LightThemeColors.mdThemeLightOnSurfaceVariant,
                                  BlendMode.srcIn,
                                )),
                            selectedIcon: SvgPicture.asset(
                                ImageCollectionSVG.chatOutlineIcon,
                                colorFilter: const ColorFilter.mode(
                                  LightThemeColors.mdThemeLightOnSurface,
                                  BlendMode.srcIn,
                                )),
                            label: S.of(context).title_chat,
                          ),
                        ],
                      ),
                    )
                  : null
            ));
      },
    );
  }
}
