import 'package:anime_hub/feature/anime_board/presetation/anime_new_item_page/anime_new_releases_page.dart';
import 'package:anime_hub/feature/anime_board/presetation/anime_new_item_page/anime_releases_vm.dart';
import 'package:anime_hub/feature/anime_board/presetation/favorite_anime_page/favorite_anime_vm.dart';
import 'package:anime_hub/feature/auth/presetation/auth_vm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reactive_variables/reactive_variables.dart';
import '../../../core/domain/router/router.gr.dart';
import '../../../theme/svg_image_collection.dart';
import '../../../theme/theme_colors.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late FavoriteAnimeRoute _favoriteAnimeRoute;
  late AnimeNewReleasesRoute _animeNewReleasesRoute;
  late AuthRoute _authRoute;
  final initialRouteObs = false.rv;

  @override
  void initState() {
    super.initState();
    _favoriteAnimeRoute = FavoriteAnimeRoute(
        vmFactory: (context) => FavoriteAnimeViewModel(context));
    _animeNewReleasesRoute = AnimeNewReleasesRoute(
        vmFactory: (context) => AnimeReleasesViewModel(context));
    _authRoute = AuthRoute(vmFactory: (context) => AuthViewModel(context));
  }

  @override
  Widget build(BuildContext context) {
    final selectIndex = 1.rv;
    return AutoTabsRouter(
      routes: [_favoriteAnimeRoute, _animeNewReleasesRoute, _authRoute],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        //пришлось прибегнуть к костылю из-за того, что autoRoute отказывается делать initial виджет с required параметром
        child: initialRouteObs.observer((context, value) => value
            ? child
            : AnimeNewReleasesPage(
                vmFactory: (context) => AnimeReleasesViewModel(context))),
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return selectIndex.observer((context, value) => Scaffold(
              body: child,
              bottomNavigationBar: NavigationBar(
                elevation: 0,
                onDestinationSelected: (value) {
                  selectIndex.value = value;
                  initialRouteObs.value = true;
                  return tabsRouter.setActiveIndex(value);
                },
                selectedIndex: selectIndex.value,
                destinations: [
                  const NavigationDestination(
                    icon: Icon(Icons.favorite_border,
                        color: LightThemeColors.mdThemeLightOnSurfaceVariant),
                    selectedIcon: Icon(Icons.favorite,
                        color: LightThemeColors.mdThemeLightOnSurface),
                    label: "Фавориты",
                  ),
                  const NavigationDestination(
                      icon: Icon(Icons.tv,
                          color: LightThemeColors.mdThemeLightOnSurfaceVariant),
                      selectedIcon: Icon(Icons.tv,
                          color: LightThemeColors.mdThemeLightOnSurface),
                      label: "Просмотр"),
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
                    label: "Чат",
                  ),
                ],
              ),
            ));
      },
    );
  }
}
